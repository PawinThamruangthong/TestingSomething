*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    String
Resource    ../PageObject/variable.robot
Resource    ../Resources/checkout_Information_Keyword.robot

*** Keywords ***

OverviewSetUp
    CheckoutSetup
    CheckoutInformationInput    John    smith    12000
    Wait Until Page Contains    Checkout: Overview
VerifyInformationDisplay
    Element Should Be Visible    ${checkout_info_payment}
    Element Should Be Visible    ${checkout_info_shipping}
    Element Should Be Visible    ${checkout_item_total_price}
    Element Should Be Visible    ${checkout_tax_price}
    Element Should Be Visible    ${checkout_final_price}
VerifyInformationData
    Element Should Contain    ${checkout_info_payment}    SauceCard #31337
    Element Should Contain    ${checkout_info_shipping}    Free Pony Express Delivery!
    Run Keyword And Expect Error    Element Should Contain    ${checkout_item_total_price}    Item total: $59.00
    Element Should Contain    ${checkout_tax_price}    Tax: $4.80
    Element Should Contain    ${checkout_final_price}    Total: $64.78
VerifyButton
    Element Should Be Visible    ${checkout_2_cancel}
    Element Should Be Visible    ${checkout_2_finish}
FinishTransaction
    Click Element    ${checkout_2_finish}
    Location Should Be    https://www.saucedemo.com/checkout-complete.html
    Page Should Contain    Thank you for your order!