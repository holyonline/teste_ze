Dado('que o usuário deseja consultar o clima de uma {string}') do |cidade|
  @query = ['q', cidade]
  insert_array(@query)
end

Quando('realizo a consulta') do
  @response = test.search_city(@query)
end

Então('recebo as condições do clima no momento na {string}') do |cidade|
  expect(@response.body).not_to be_nil
  expect(@response.code).to eql 200
  expect(@response['name']).to eql(cidade)
  expect(@response).to include('id')
  log @response
end

Dado('que o usuário deseja consultar o clima de uma cidade com um {int}') do |id|
  @query = ['id', id]
  insert_array(@query)
end

Então('recebo as condições do clima pelo {int} na cidade') do |id|
  expect(@response.body).not_to be_nil
  expect(@response.code).to eql 200
  expect(@response['id']).to eql(id)
  expect(@response).to include('name')
  log @response
end

Dado('que o usuário deseja consultar o clima de uma cidade com uma coordenada {float} e {float}') do |lon, lat|
  @query = ['lon', lon, 'lat', lat]
  insert_array(@query)
end

Então('recebo as condições do clima pelas {float} e {float} da cidade') do |lon, lat|
  expect(@response.body).not_to be_nil
  expect(@response.code).to eql 200
  expect(@response['coord']['lon']).to eql(lon)
  expect(@response['coord']['lat']).to eql(lat)
  expect(@response).to include('name')
  expect(@response).to include('id')
  log @response
end

Dado('que o usuário deseja consultar o clima de uma cidade que não existe') do
  @query = ['q', 'nonexisttest']
  insert_array(@query)
end

Então('recebo o status page {string}') do |status_page|
  expect(@response.code).to eql 404
  expect(@response['cod']).to eql status_page
  expect(@response['message']).to eql 'city not found'
  log @response
end

















Dado("ter massa {string} configurada para requisição POST para validar criação de pedidos") do |dados|
  file_path = dados.eql?('valido') ? PAYLOAD_PATH['Test']['post_create_order_valido'] : PAYLOAD_PATH['Test']['post_create_order_invalido']
  @body = File.read(file_path)
end

Quando("eu realizo um novo pedido na API") do
  @response = order.post_create_order(@body)
  puts "Status code #{@response.code}"
end

Então("tenho a mensagem de resposta {string}") do |tipo|
  if tipo.eql?('positivo')
    expect(@response.body).not_to be_nil 
    expect(@response.code).to eql 201
    expect(@response['status']).to eql('CREATED')
    expect(@response).to include('id')
    expect(@response['ownId']).to eql api_data_load(%w[weather accounts body customer own_id])
    expect(@response).to include('status')
    expect(@response).to include('platform')
    expect(@response).to include('createdAt')
    expect(@response).to include('updatedAt')
    expect(@response).to include('amount')
    expect(@response['amount']).to include('paid')
    expect(@response['amount']).to include('total')
    expect(@response['amount']).to include('fees')
    expect(@response['amount']).to include('refunds')
    expect(@response['amount']).to include('liquid')
    expect(@response['amount']).to include('otherReceivers')
    expect(@response['amount']).to include('currency')
    expect(@response['amount']).to include('subtotals')
    expect(@response['amount']['subtotals']).to include('shipping')
    expect(@response['amount']['subtotals']).to include('addition')
    expect(@response['amount']['subtotals']).to include('discount')
    expect(@response['amount']['subtotals']).to include('items')
    expect(@response['customer']['id']).to eql api_data_load(%w[weather accounts body customer id_valido])
  else
    expect(@response.body).not_to be_nil 
    expect(@response.code).to eql 400
    expect(@response['errors'][0]).to include('code')
    expect(@response['errors'][0]).to include('path')
    expect(@response['errors'][0]).to include('description')
  end 
end
  
Dado("ter massa de {string} configurada para requisição GET para validar consulta de pedidos") do |dados|
  file_path = dados.eql?('valido') ? PAYLOAD_PATH['Test']['post_create_order_valido'] : PAYLOAD_PATH['Test']['post_create_order_invalido']
  @body = File.read(file_path)
  @response = order.post_create_order(@body)
  dados.eql?('valido') ? @order_id = @response['id'] : @order_id = 'XXX-G11BK11K111L'
end

Quando("consulto a API de pedidos") do
  @response = order.get_check_order(@order_id)
end

Então("recebo o resultado da consulta {string}") do |tipo|
  if tipo.eql?('positivo')
    expect(@response.body).not_to be_nil 
    expect(@response.code).to eql 200
    expect(@response['status']).to eql('CREATED')
    expect(@response).to include('id')
    expect(@response['ownId']).to eql api_data_load(%w[weather accounts body customer own_id])
    expect(@response).to include('status')
    expect(@response).to include('platform')
    expect(@response).to include('createdAt')
    expect(@response).to include('updatedAt')
    expect(@response).to include('amount')
    expect(@response['amount']).to include('paid')
    expect(@response['amount']).to include('total')
    expect(@response['amount']).to include('fees')
    expect(@response['amount']).to include('refunds')
    expect(@response['amount']).to include('liquid')
    expect(@response['amount']).to include('otherReceivers')
    expect(@response['amount']).to include('currency')
    expect(@response['amount']).to include('subtotals')
    expect(@response['amount']['subtotals']).to include('shipping')
    expect(@response['amount']['subtotals']).to include('addition')
    expect(@response['amount']['subtotals']).to include('discount')
    expect(@response['amount']['subtotals']).to include('items')
    expect(@response['customer']['id']).to eql api_data_load(%w[weather accounts body customer id_valido])
  else
    expect(@response.body).to eql('Not Found')
    expect(@response.code).to eql 404
 end 
end

Dado("ter massa de dados configurada para requisição GET para validar lista de pedidos realizados") do
  file_order_path = PAYLOAD_PATH['Test']['post_create_order_valido']
  @body = File.read(file_order_path)
  @response = order.post_create_order(@body)
  @order_id = @response['id']
  
  file_path = PAYLOAD_PATH['payments']['post_create_payment_valido']
  @body = File.read(file_path)  

  @response = payment.post_create_payment(@order_id, @body)
  expect(@response.code).to eql 201
end

Quando("consulto a API de listagem de pedidos") do
  @response = order.get_list_Test
  expect(@response.code).to eql 200
end

Então("recebo a lista de pedidos feitos") do
  expect(@response.body).not_to be_nil
  expect(@response).to include('_links')
  expect(@response).to include('summary')
  expect(@response).to include('Test')
  expect(@response['Test'][0]['ownId']).to eq api_data_load(%w[weather accounts body customer own_id])
end