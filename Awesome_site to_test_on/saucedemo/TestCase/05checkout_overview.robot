*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/checkout_Overview_Keyword.robot
Test Setup    OverviewSetUp


*** Test Cases ***

Default
    Page Should Contain    Checkout: Overview
Submenu
    Submenu - CheckAll
Cart
    CartItem Detail    1
    CartItem Detail    2
CheckOutInformationUI
    VerifyInformationDisplay
VerifyInformationData
    [Tags]    Fail
    [Documentation]    Item total display incorrectly
    VerifyInformationDisplay
Check Button
    VerifyButton
Cancel Button
    Click Element    ${checkout_2_cancel}
    Location Should Be    https://www.saucedemo.com/inventory.html
CompleteTransaction
    FinishTransaction