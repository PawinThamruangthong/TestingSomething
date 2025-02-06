*** Settings ***
Library    AppiumLibrary
Resource    ${CURDIR}/variable.robot

*** Keywords ***
OpenApp
    Open Application       remote_url=${RemoteURL}    
    ...                    platformName=${PlatformName}    
    ...                    playformVersion=${PlatformVersion}    
    ...                    devicename=${DeviceName}
    ...                    automationName=UiAutomator2  
    ...                    appPackage=${appPackage2}
    ...                    appActivity=${appActivity2}
    ...                    NoReset=${True}
    Element Should Be Visible    ${header}
Eletxt
    [Arguments]    ${ele}    ${txt}
    Element Should Contain Text    ${ele}    ${txt}
#MainPage
OpenSubMenu
    [Arguments]    ${menu}
    # menu> cata webview qr geo drawing about reset_app_state biometrics login logout api_calls sauce_bot
    Wait Until Element Is Visible    ${open_menu_btn}
    Click Element    ${open_menu_btn}
    Wait Until Element Is Visible    ${menu_${menu}}
    Click Element    ${menu_${menu}}