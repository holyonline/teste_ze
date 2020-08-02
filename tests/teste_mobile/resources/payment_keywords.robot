***Settings***

Resource        ../resources/base.robot

***Keywords***
Então ele irá para a forma de pagamento

    Wait Until Page Contains    Apresente um documento com foto na entrega para comprovar sua idade (18+)       15
    Click Text                  SELECIONAR FORMA DE PAGAMENTO

    Wait Until Page Contains    FORMA DE PAGAMENTO                 15
    Wait Until Page Contains    PAGAMENTO NA ENTREGA               15

E realiza pagamento em Cartão de Débito ou Crédito

    Wait Until Page Contains    Cartão de Débito ou Crédito        15
    Wait Until Page Contains    Dinheiro                           15

    Click Text                  Cartão de Débito ou Crédito        15

    Wait Until Page Contains    Por precaução:                     15
    Wait Until Page Contains    Evite o pagamento com dinheiro em espécie                     15
    Wait Until Page Contains    É mais seguro para você e para o entregador                   15

    Click Element               xpath=//android.view.ViewGroup[@content-desc="checkout-payment-action-button"]/android.widget.TextView

E realiza pagamento em dinheiro

    Wait Until Page Contains    Cartão de Débito ou Crédito        15
    Wait Until Page Contains    Dinheiro                           15

    Click Text                  Dinheiro                           15

    Wait Until Page Contains    Por precaução:                     15
    Wait Until Page Contains    Evite o pagamento com dinheiro em espécie                     15
    Wait Until Page Contains    É mais seguro para você e para o entregador                   15

    Click Element               xpath=//android.view.ViewGroup[@content-desc="checkout-payment-action-button"]/android.widget.TextView

E verifica confirmação do pedido

    Wait Until Page Contains    Confirmação do pedido              15
    Wait Until Page Contains    Receber agora em                   15
    Wait Until Page Contains    ${address}                         15

    Wait Until Page Contains    Pagamento na entrega               15

    # Click Text                  CONFIRMAR COMPRA                   15
