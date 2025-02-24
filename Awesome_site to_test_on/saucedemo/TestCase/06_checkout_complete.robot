*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/checkout_Complete.robot
Test Setup    CompleteSetup

*** Test Cases ***
Default
    Page Should Contain    Checkout: Complete!
Submenu
    Submenu - CheckAll
Href
    hrefCheck
VerifyMsg
    VerifyMsg
BackHome
    Home Btn
