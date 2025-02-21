*** Settings ***
Library    SeleniumLibrary
Resource    ../PageObject/variable.robot
*** Keywords ***
OpenSite
    Open Browser    ${url}    ${browser}    
Login
    [Arguments]    ${username}    ${password}
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