*** Settings ***
Library                    SeleniumLibrary
Library                    String
Resource                   ../PageObjects/variable.robot
Resource                   ${CURDIR}/accountKeyword.robot
Resource                   ${CURDIR}/cartKeyword.robot

*** Keywords ***
PaymentInfo
    [Arguments]    ${name}    ${card}    ${cvc}    ${mm}    ${yy}
    Input Text    ${payment_name}    ${name}
    Input Text    ${payment_card_num}    ${card}
    Input Text    ${payment_card_cvc}    ${cvc}
    Input Text    ${payment_card_mm}    ${mm}
    Input Text    ${payment_card_yy}    ${yy}
    ClickBtn      ${payment_confirm_btn}