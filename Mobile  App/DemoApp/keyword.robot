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
    ...                    autoGrantPermissions=${True}
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
OpenSubmenuByTab
    [Arguments]    ${menu}
    @{finger} =    Create List    ${89}    ${152}
    @{positions} =    Create List    ${finger}
    Tap With Positions    ${100}    ${finger}
    Wait Until Element Is Visible    ${menu_${menu}}    5s
    Click Element    ${menu_${menu}}
    Sleep    1s
#Login/Logout
Login
    OpenSubmenuByTab    login
    Wait Until Element Is Visible    ${username}
    Input Text    ${username}    bob@example.com
    Input Text    ${password}    10203040
    Click Element    ${login_btn}
    OpenSubmenuByTab    login
    Text Should Be Visible    No Items
Logout
    OpenSubmenuByTab    logout
    Wait Until Element Is Visible    android:id/button1
    Click Element    android:id/button1