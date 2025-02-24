*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    String
Resource    ../PageObject/variable.robot
Resource    ../Resources/cartKeyword.robot


*** Keywords ***
CheckoutSetup
    NormalUser
    AddItemAndGotoCart
    CartCheckOut
CheckoutInformationInput
    [Arguments]    ${first_name}    ${last_name}    ${zip}
    Input Text    ${checkout_first_name}     ${first_name}
    Input Text    ${checkout_last_name}      ${last_name}
    Input Text    ${checkout_zip}            ${zip}
    Click Element    ${checkout_continue}
CheckoutErrorMsgVerify
    [Arguments]    ${msg}
    Wait Until Element Is Visible   ${checkout_error_msg}
    Element Should Contain    ${checkout_error_msg}    ${msg}