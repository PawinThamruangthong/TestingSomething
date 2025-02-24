*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/checkout_Information_Keyword.robot
Test Setup    CheckoutSetup


*** Test Cases ***
Default
    Page Should Contain    Checkout: Your Information
Submenu - about
#${allitem},${about},${logout},${resetApp}
    SelectSubmenu    about
    Location Should Be    https://saucelabs.com/
Submenu - Item
    SelectSubmenu    allitem
    Location Should Be    https://www.saucedemo.com/inventory.html
Submenu - Logout
    SelectSubmenu    logout
    Location Should Be    https://www.saucedemo.com/
    NotLoggedIn
Submenu - ResetApp
    SelectSubmenu    resetApp
    Reload Page
    Click Element    ${btn_cart}
    Location Should Be    https://www.saucedemo.com/cart.html
    Page Should Not Contain Element    xpath=//*[@class="cart_item"]
Submenu - Cart
    Click Element    ${btn_cart}
    Page Should Contain Element    xpath=//*[@class="cart_item"]
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
