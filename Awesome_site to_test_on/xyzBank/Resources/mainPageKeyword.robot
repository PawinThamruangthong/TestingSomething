*** Settings ***
Library    SeleniumLibrary
Resource    ../PageObject/variable.robot
*** Keywords ***

OpenMainPage
    Open Browser    ${url}    ${browser}
    Wait Until Page Contains    XYZ
ClickHome
    Wait Until Element Is Visible    ${btn_home}
    Click Element    ${btn_home}
Login_btn_Customer
    Wait Until Element Is Visible    ${login_cus}
    Click Element    ${login_cus}
Login_btn_Manager
    Wait Until Element Is Visible    ${login_bank}
    Click Element    ${login_bank}
Customer_Logout_btn
    Wait Until Element Is Visible    ${btn_logout}
    Click Element    ${btn_logout}
    Wait Until Element Is Visible    ${cus_acc}
GoToHome
    ClickHome
    Wait Until Page Contains    XYZ
    Element Should Be Visible    ${login_cus}
    Element Should Be Visible    ${login_bank}
    Location Should Be    https://www.globalsqa.com/angularJs-protractor/BankingProject/#/login
CustomerLogin
    [Arguments]    ${account}
    Wait Until Element Is Visible    ${cus_acc}
    Select From List By Value    ${cus_acc}    ${account}
    Wait Until Element Is Visible    ${cus_login_btn}
    ${name}=    Get Selected List Label    ${cus_acc}
    #${name}=    Get Text    ${cus_acc}
    Click Element    ${cus_login_btn}
    Wait Until Page Contains    Welcome ${name}
ManagerLogin
    Wait Until Element Is Visible    ${login_bank}
    Click Element    ${login_bank}
    Wait Until Element Is Visible    ${mng_add_cus}