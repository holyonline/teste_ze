***Settings***
Library     AppiumLibrary

Resource    address_keywords.robot
Resource    general_data.robot
Resource    login_keywords.robot
Resource    navigation_keywords.robot
Resource    payment_keywords.robot
Resource    signup_keywords.robot

***Variables***

${welcome1}                É um prazer ter você por aqui! 
${welcome2}                Vamos nessa?

***Keywords***
Start Session
    Set Appium Timeout  10
    Open Application    http://localhost:4723/wd/hub
    ...                 automationName=UiAutomator2
    ...                 platformName=Android
    ...                 deviceName=Android Emulator
    ...                 appPackage=com.cerveceriamodelo.modelonow
    ...                 appActivity=.MainActivity
    ...                 autoGrantPermissions=true
    Sleep               10

    ${continuar}=               Run Keyword And Return Status                 Element Should Be Visible        xpath=//android.view.ViewGroup[@content-desc="onboarding-secondary-action-button"]/android.widget.TextView
    Run Keyword If              ${continuar}          Click Element           xpath=//android.view.ViewGroup[@content-desc="onboarding-secondary-action-button"]/android.widget.TextView

    ${allow}=                   Run Keyword And Return Status           Element Should Be Visible        id=com.android.packageinstaller:id/permission_allow_button
    Run Keyword If              ${allow}                                Click Element                    id=com.android.packageinstaller:id/permission_allow_button

    Start app

Start app
    Wait Until Page Contains             ${welcome1}            15
    Wait Until Page Contains             ${welcome2}            15

Close Session
    Sleep                                2
    Capture Page Screenshot
    Close Application