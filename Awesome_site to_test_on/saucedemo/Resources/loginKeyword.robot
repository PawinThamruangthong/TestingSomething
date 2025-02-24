*** Settings ***
Library    SeleniumLibrary
Resource    ../PageObject/variable.robot
*** Keywords ***
OpenSite
    Open Browser    ${url}    ${browser}    
Login
    [Arguments]    ${username}    ${password}
    Wait Until Element Is Visible    ${login_username}
    Input Text    ${login_username}    ${username}
    Input Text    ${login_password}    ${password}
    Click Element    ${login_button}
ErrorMessageCheck
    [Arguments]    ${msg}
    Element Should Be Visible    ${login_error_message}
    Element Should Contain    ${login_error_message}    ${msg}
LoginErrorUsername
    [Arguments]    ${username}
    Login    ${username}    secret_sauce
    ErrorMessageCheck    Epic sadface: Username and password do not match any user in this service
LoginErrorPassword
    [Arguments]    ${username}    ${password}
    Login    ${username}    ${password}
    ErrorMessageCheck    Epic sadface: Username and password do not match any user in this service
LoginSuccess
    [Arguments]    ${username}
    Login    ${username}    secret_sauce
    Wait Until Page Contains    Products
NotLoggedIn
    Go To    https://www.saucedemo.com/inventory.html
    ErrorMessageCheck    Epic sadface: You can only access '/inventory.html' when you are logged in.

#User Type Login
#UserKeyword
NormalUser
    OpenSite
    LoginSuccess    standard_user
    Wait Until Page Contains   Swag Labs
ProblemUser
    OpenSite
    LoginSuccess    problem_user
    Wait Until Page Contains   Swag Labs
PerformanceGlitchUser
    OpenSite
    Login    performance_glitch_user    secret_sauce
ErrorUser
    OpenSite
    LoginSuccess    error_user
    Wait Until Page Contains   Swag Labs
VisualUser
    OpenSite
    LoginSuccess    visual_user
    Wait Until Page Contains   Swag Labs