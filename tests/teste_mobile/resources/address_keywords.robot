***Settings***

Resource        ../resources/base.robot

***Keywords***
E informa seu endereço

    Wait Until Page Contains    Onde você quer suas bebidas?       15
    Wait Until Page Contains    Usar minha localização             15
    Input Text                  xpath=//android.widget.EditText[@content-desc="address input"]              ${address}
    Sleep                       1
    Element Text Should Be      xpath=//android.view.ViewGroup[@content-desc="address-card-auto-complete"]/android.widget.TextView[2]           ${address}
    Click Element               xpath=//android.view.ViewGroup[@content-desc="address-card-auto-complete"]/android.widget.TextView[2]

    Wait Until Page Contains    ENDEREÇO                           15
    Click Element               xpath=//android.view.ViewGroup[@content-desc="home-button"]
    Click Element               xpath=//android.view.ViewGroup[@content-desc="not-own-complemnt"]
    Click Element               xpath=//android.view.ViewGroup[@content-desc="continue"]

Quando ele visualiza a tela de detalhes do pedido

    Wait Until Page Contains    VER PRODUTOS DISPONÍVEIS           15
    Wait Until Page Contains    DETALHES DO PEDIDO                 15
    Wait Until Page Contains    Endereço                           15
    Wait Until Page Contains    ${address}                         15
        
    Click Element               xpath=//android.view.ViewGroup[@content-desc="see-products"]