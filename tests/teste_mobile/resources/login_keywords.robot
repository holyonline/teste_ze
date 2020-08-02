***Settings***

Resource        ../resources/base.robot

***Keywords***
Dado que o usuário irá entrar no aplicativo sem cadastro
 
    Click Text                  Continuar sem cadastro

Dado que o usuário realiza o login
    
    Click Element               xpath=//android.view.ViewGroup[@content-desc="already-have-an-account"]/android.widget.TextView

    Wait Until Page Contains    ENTRAR                             15

    Wait Until Page Contains    Não tem uma conta? Inscreva-se     15
    Input Text                  xpath=//android.widget.EditText[@content-desc="email"]                   ${email_login}
    Input Text                  xpath=//android.widget.EditText[@content-desc="password"]                ${password}

    Click Element               xpath=//android.view.ViewGroup[@content-desc="enter"]

    Wait Until Page Contains    Onde você quer suas bebidas?       15
    Click Text                  Casa

    Wait Until Page Contains    ENDEREÇO                           15

    Click Element               xpath=//android.view.ViewGroup[@content-desc="continue"]

E informa sua idade

    Wait Until Page Contains    Antes de continuar…               15
    Wait Until Page Contains    Você tem 18 anos ou mais?          15
    
    Click Element               xpath=//android.view.ViewGroup[@content-desc="button-yes"]