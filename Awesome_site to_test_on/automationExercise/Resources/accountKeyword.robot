*** Settings ***
Library                    SeleniumLibrary
Library                    String
Resource                   ../PageObjects/variable.robot
Resource                   ${CURDIR}/uniKeyword.robot

*** Keywords ***
Register
    [Arguments]    ${email}    ${name}
    Input Text     ${register_name}    ${name}
    Input Text     ${register_email}    ${email}
    ClickBtn       ${register_btn}
SignUp
    [Arguments]    ${name}    ${email}    ${password}    ${ifname}    ${ilname}    ${icompany}    
    ...    ${iaddress1}    ${iaddress2}    ${icountry}    ${istate}    ${icity}    ${izipcode}    ${imobile}
    Input Text      ${register_name}    ${name}
    Input Text      ${register_email}    ${email}
    Click Button    ${register_btn}
    Wait Until Page Contains    Title
    Click Element     ${radio_title_female}
    Input Text        ${register_password}    ${password}
    Select From List By Value     ${dropdown_day}      1
    Select From List By Index     ${dropdown_month}    3
    Select From List By Value     ${dropown_year}      1998 
    Input Text                    ${firstname}     ${ifname}
    Input Text                    ${lastname}      ${ilname}
    Input Text                    ${company}       ${icompany}
    Input Text                    ${address1}      ${iaddress1}
    Input Text                    ${address2}      ${iaddress2}
    Select From List By Value     ${country}       ${icountry}
    Input Text                    ${state}         ${istate}
    Input Text                    ${city}          ${icity}
    Input Text                    ${zipcode}       ${izipcode}
    Input Text                    ${mobile}        ${imobile}
    ClickBtn                    ${btn_createAccount}
    Wait Until Page Contains    Account Created!    5s
    ClickBtn                    ${btn_CreateAccountcontinue}
    Wait Until Page Contains    Logged in as ${name}    5s

AccountDelete
    ClickBtn                    ${btn_accdelete}
    Wait Until Page Contains    Account Deleted!    5s
    ClickBtn                    ${btn_accdeletecontinue}
    Wait Until Page Contains    AutomationExercise
AccountDelete2
    ClickBtn                    ${btn_accdelete}
    Wait Until Page Contains    Account Deleted!    5s
    ClickBtn                    ${btn_accdel2}
    Wait Until Page Contains    AutomationExercise
Login
    [Arguments]    ${username}    ${password}
    Input Text     ${login_email}    ${username}
    Input Text     ${login_password}    ${password}
    ClickBtn       ${acc_login_btn}
