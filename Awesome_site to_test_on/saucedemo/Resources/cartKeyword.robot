*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    String
Resource    ../PageObject/variable.robot
Resource    ../Resources/inventoryKeyword.robot

*** Keywords ***
CartSetUp
    NormalUser
    AddItemAndGotoCart
GotoCartPage
    Click Element    ${btn_cart}
AddItemAndGotoCart
    GetitemBtn    1
    GetitemBtn    2
    GotoCartPage
CartItem Detail
    [Arguments]    ${num}
    @{item_name}=    Get WebElements    xpath=//*[@class="inventory_item_name"]
    @{item_quantity}=    Get WebElements    xpath=//*[@class="cart_quantity"]
    @{item_detail}=    Get WebElements    xpath=//*[@class="inventory_item_desc"]
    @{item_price}=    Get WebElements    xpath=//*[@class="inventory_item_price"]
CartRemoveItem
    [Arguments]    ${num}
    @{item_remove_btn}=    Get WebElements    xpath=//*[@class="btn btn_secondary btn_small cart_button"]
    Wait Until Element Is Enabled    ${item_remove_btn}[${num}]
    Click Element    ${item_remove_btn}[${num}]
    Page Should Contain Element    ${cart_item_${num}}
CartCheckOut
    Wait Until Element Is Visible    ${btn_checkout}
    Click Button    ${btn_checkout}
    Location Should Be    https://www.saucedemo.com/checkout-step-one.html
FinishTransaction
    Click Element    ${checkout_2_finish}
    Location Should Be    https://www.saucedemo.com/checkout-complete.html
    Page Should Contain    Thank you for your order!