*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    String
Resource    ../PageObject/variable.robot
Resource    ../Resources/checkout_Overview_Keyword.robot

*** Keywords ***

CompleteSetup
    OverviewSetUp
    FinishTransaction
VerifyMsg
    Element Should Contain    ${checkout_complete_header}    Thank you for your order!
    Element Should Contain    ${checkout_complete_text}      Your order has been dispatched, and will arrive just as fast as the pony can get there!
Home Btn
    Element Should Be Enabled    ${checkout_complete_back_home_btn}
    Click Element    ${checkout_complete_back_home_btn}
    Location Should Be    https://www.saucedemo.com/inventory.html

