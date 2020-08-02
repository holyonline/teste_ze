***Settings***

Resource        ../resources/base.robot

***Keywords***
Ele visualiza a tela de cardápio de bebidas

    Sleep                       1
    ${close_update_popup}=            Run Keyword And Return Status                 Element Should Be Visible        xpath=//android.view.ViewGroup[@content-desc="modal-close"]
    Run Keyword If                    ${close_update_popup}          Click Element           xpath=//android.view.ViewGroup[@content-desc="modal-close"]

    Wait Until Page Contains    Receber agora em                   15
    Wait Until Page Contains    ${address}                         15
    Wait Until Page Contains    Cervejas                           15
    
E abre a tela cardápio de Cervejas

    Click Element               xpath=//android.view.ViewGroup[@content-desc="category-menu-Cervejas"]

    Wait Until Page Contains    AS CONSAGRADAS                     15
    Wait Until Page Contains    AS PRESTIGIADAS                    15

E seleciona a primeira Brahma do carrossel

    Swipe By Percent            50      50      50      11.45

    ${brahma}=         Get Text        xpath=(//android.widget.TextView[@content-desc="product-card-title"])[1]
    Click Text              ${brahma}

    Wait Until Page Contains    ADICIONAR (1)                      15
    Wait Until Page Contains    ${brahma}                          15

E seleciona a primeira Skol do carrossel

    Swipe By Percent            50      50      50      11.45
    Swipe By Percent            50      50      50      11.45

    ${skol}=         Get Text         xpath=(//android.widget.TextView[@content-desc="product-card-title"])[4]
    Click Text               ${skol}

    Wait Until Page Contains    ADICIONAR (1)                      15
    Wait Until Page Contains    ${skol}                            15

E adiciona o produto a sacola

    # Click Element               xpath=//android.view.ViewGroup[@content-desc="12-unit-button"]
    Click Text                  12 un.
    ${valor}=         Get Text         xpath=//android.view.ViewGroup[@content-desc="add-to-checkout"]/android.widget.TextView[2]
    Click Text                  ADICIONAR (12)

E verifica se o produto foi adicionado na sacola

    Wait Until Page Contains        Você possui 12 produtos na sacola       15
    
    Wait Until Page Contains        Continuar comprando                     15
    Click Text                      VER SACOLA

    Wait Until Page Contains        SACOLA                             15

    Swipe By Percent                50      50      50      11.45

E verifica se é possível visualizar o Entre para finalizar a compra após produto no carrinho sem cadastro

    Wait Until Page Contains        Entre para finalizar a compra      15

    Swipe By Percent                50      50      50      11.45

    Swipe By Percent                50      50      50      11.45

    Wait Until Page Contains        ENTRAR PARA CONTINUAR              15
