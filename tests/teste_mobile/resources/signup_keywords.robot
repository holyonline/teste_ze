***Settings***

Resource        ../resources/base.robot

***Keywords***
Dado que eu gostaria de criar um novo cadastro

    Wait Until Page Contains         É um prazer ter você por aqui!     15
    Wait Until Page Contains         Vamos nessa?                       15
    
    Click Text                       CRIAR UMA CONTA

    Wait Until Page Contains         CADASTRE-SE PARA CONTINUAR                            15
    Wait Until Page Contains         Visualize seus pedidos e ofertas exclusivas!          15
    Wait Until Page Contains         Já possui uma conta? Entre aqui                       15
    
    Wait Until Page Contains         ENTRAR COM FACEBOOK                                   15
    Wait Until Page Contains         Ou se cadastre com seu e-mail                         15

    Wait Until Page Contains         A senha deve ter 8 ou mais caracteres e ao menos 1 número.          15
    Input Text                       xpath=//android.widget.EditText[@content-desc="full name"]              ${full_name}
    Input Text                       xpath=//android.widget.EditText[@content-desc="email address"]          ${email_signup}
    Input Text                       xpath=//android.widget.EditText[@content-desc="password"]               ${password}

    Wait Until Page Contains         A senha deve ter 8 ou mais caracteres e ao menos 1 número.          15

    Input Text                       xpath=//android.widget.EditText[@content-desc="document"]               ${cpf}
    Input Text                       xpath=//android.widget.EditText[@content-desc="phone number"]           ${phone_number}
    
    Swipe By Percent                 50      50      50      11.45

    Click Element                    xpath=//android.view.ViewGroup[@content-desc="age-input-touchable"]/android.view.ViewGroup/android.view.ViewGroup/android.widget.TextView
    Wait Until Element Is Visible    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup            15
    Swipe By Percent                 50      75.52      50      28.65
    Click Text                       33 anos
    Click Text                       Confirmar Idade

    Wait Until Page Contains         Por que pedimos essas informações?                    15
    Wait Until Page Contains         CADASTRAR E CONTINUAR                                 15
    Wait Until Page Contains         ${termo_de_uso}                                       15
    
    Click Text                       CADASTRAR E CONTINUAR