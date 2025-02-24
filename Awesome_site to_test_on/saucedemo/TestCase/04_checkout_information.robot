*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/checkout_Information_Keyword.robot
Test Setup    CheckoutSetup


*** Test Cases ***
# Normal User
Default
    Page Should Contain    Checkout: Your Information
Submenu
    Submenu - CheckAll
Href
    hrefCheck
Cancel Button
    Click Element    ${checkout_cancel}
    Location Should Be    https://www.saucedemo.com/cart.html
Continue - Error Fist Name
    [Tags]    InputError
    CheckoutInformationInput    ${EMPTY}    smith    10000
    CheckoutErrorMsgVerify    Error: First Name is required
Continue - Error Last Name
    [Tags]    InputError
    CheckoutInformationInput    John    ${EMPTY}    10000
    CheckoutErrorMsgVerify    Error: Last Name is required
Continue - Error Postal Code
    [Tags]    InputError
    CheckoutInformationInput    John    smith    ${EMPTY}
    CheckoutErrorMsgVerify    Error: Postal Code is required
Continue - Seccess
    CheckoutInformationInput    John    smith    12000
    Wait Until Page Contains    Checkout: Overview
HideErrorMsg
    CheckoutInformationInput    John    ${EMPTY}    10000
    CheckoutErrorMsgVerify    Error: Last Name is required
    Click Element    ${checkout_hide_error_msg}
    Wait Until Element Is Not Visible   ${checkout_error_msg}
ErrorShouldNotVisibleForCorrectedInput
    [Tags]    Fail
    [Documentation]    Error symbols should not appear in corrected input
    CheckoutInformationInput    John    ${EMPTY}    10000
    CheckoutErrorMsgVerify    Error: Last Name is required
    #Element Should Be Visible        xpath=//*[@id="checkout_info_container"]/div/form/div[1]/div[1]/svg/path
    Wait Until Element Is Visible    ${error_symbol_lname}
    Run Keyword And Expect Error    *    Element Should Not Be Visible    ${error_symbol_fname}
    Run Keyword And Expect Error    *    Element Should Not Be Visible    ${error_symbol_zip}

#Prob User
Prob_default
    [Setup]    Prob_CheckOut
    Page Should Contain    Checkout: Your Information
Prob_Continue
    [Setup]    Prob_CheckOut
    [Tags]    Fail
    CheckoutInformationInput    John    smith    12000
    Run Keyword And Expect Error    *    Element Should Not Be Visible    ${checkout_error_msg}
Prob_Href
    [Setup]    Prob_CheckOut
    hrefCheck