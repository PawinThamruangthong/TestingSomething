*** Settings ***
Library    AppiumLibrary
Resource    ${CURDIR}/keyword.robot
Task Setup    OpenApp

*** Test Cases ***
  
1 OpenApp
    ${txt}=    Get Text    //android.widget.TextView[@text="Products"]
    Eletxt    //android.widget.TextView[@text="Products"]    Products
#Submenu
    # menu> cata webview qr geo drawing about reset_app_state biometrics login logout api_calls sauce_bot
Submenu - Webview
    OpenSubMenu    webview
    Page Should Contain Text    Webview
    Input Text    ${web_input}    www.automationexercise.com
    Click Element    //android.widget.TextView[@text="Go To Site"]
    Wait Until Page Contains     AutomationExercise
Submenu - Catalog
    OpenSubMenu    webview
    Go Back
    #Page Should Contain Text    cata
Submenu - drawing
    OpenSubMenu    drawing
    Wait Until Element Is Visible    //android.webkit.WebView[@text="Signature Pad demo"]/android.view.View/android.view.View/android.widget.Image[3]
    Swipe    100    500    800    500
    #Element Value Should Be    ${null}
    Click Element    xpath=//android.widget.TextView[@text="Clear"]