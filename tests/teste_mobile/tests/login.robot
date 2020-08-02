***Settings***

Resource        ../resources/base.robot

Test Setup      Start Session
Test Teardown   Close Session

***Test Cases***
Realizar uma entrada no aplicativo sem Dado que o usuário realiza o login
    [tags]              nav_without_login

    Dado que o usuário irá entrar no aplicativo sem cadastro
    E informa sua idade
    E informa seu endereço
    Quando ele visualiza a tela de detalhes do pedido
    Ele visualiza a tela de cardápio de bebidas

Realizar um login com sucesso
    [tags]              login_successful

    Dado que o usuário realiza o login
    Quando ele visualiza a tela de detalhes do pedido
    Ele visualiza a tela de cardápio de bebidas


