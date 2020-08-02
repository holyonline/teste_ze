 # funcao recebe um array de chaves e retorna os dados encontrados na massa
def api_data_load(keys)
  # busca massa no arquivo por ambiente
  data = search(keys, API_DATA || {})
  return data unless data.nil?

  # busca massa no arquivo geral
  search(keys, CONFIG_API)
end

def search(keys, data)
  keys = keys.split(' ') if keys.instance_of? String
  keys.each do |key|
    data = data[key]
    break if data.nil?
  end
  data
end

def payload(file_path, data)
  file = File.read(file_path)
  hash_file = JSON.parse(file)
  hash_file.transform_values.with_index do |value, ind|
    value = data[ind]
  end
end

def curl(response)
  log(response)
  log(response.request.http_method)
  log(response.request.last_response)
  log(response.request.last_uri)
  log(response.request.options)
  log(response.request.path)
end

def insert_array(query)
  @query_temp = YAML.load_file(PAYLOAD_PATH['test']['query_weather']).to_a
  @query_temp.insert(0, @query)
  @query_temp = @query_temp.flatten
  @query = Hash[*@query_temp]
end