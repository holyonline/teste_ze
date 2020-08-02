***Settings***

Resource        ../resources/base.robot

Test Setup      Start Session
Test Teardown   Close Session

***Test Cases***
Realizar a compra da primeira Skol do carrossel usando cartão de débito ou crédito
    [tags]              buy_skol
    
    Dado que o usuário realiza o login
    Quando ele visualiza a tela de detalhes do pedido
    Ele visualiza a tela de cardápio de bebidas
    E abre a tela cardápio de Cervejas
    E seleciona a primeira Skol do carrossel
    E adiciona o produto a sacola
    E verifica se o produto foi adicionado na sacola
    Então ele irá para a forma de pagamento
    E realiza pagamento em Cartão de Débito ou Crédito
    E verifica confirmação do pedido

Realizar a compra da primeira Brahma do carrossel usando dinheiro
    [tags]              buy_brahma

    Dado que o usuário realiza o login
    Quando ele visualiza a tela de detalhes do pedido
    Ele visualiza a tela de cardápio de bebidas
    E abre a tela cardápio de Cervejas
    E seleciona a primeira Brahma do carrossel
    E adiciona o produto a sacola
    E verifica se o produto foi adicionado na sacola
    Então ele irá para a forma de pagamento
    E realiza pagamento em dinheiro
    E verifica confirmação do pedido

Realizar a compra da primeira Skol do carrossel sem login efetuado
    [tags]              buy_skol_wo_login

    Dado que o usuário irá entrar no aplicativo sem cadastro
    E informa sua idade
    E informa seu endereço
    Quando ele visualiza a tela de detalhes do pedido
    Ele visualiza a tela de cardápio de bebidas
    E abre a tela cardápio de Cervejas
    E seleciona a primeira Skol do carrossel
    E adiciona o produto a sacola
    E verifica se o produto foi adicionado na sacola
    Então ele irá para a forma de pagamento
    E realiza pagamento em Cartão de Débito ou Crédito
    E verifica confirmação do pedido
    E verifica se é possível visualizar o Entre para finalizar a compra após produto no carrinho sem cadastro
