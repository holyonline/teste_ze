***Settings***

Resource        ../resources/base.robot

Test Setup      Start Session
Test Teardown   Close Session

***Test Cases***
Realizar novo cadastro
    [tags]              signup_successful

    Dado que eu gostaria de criar um novo cadastro
    E informa seu endereço
    Quando ele visualiza a tela de detalhes do pedido
    Ele visualiza a tela de cardápio de bebidas














