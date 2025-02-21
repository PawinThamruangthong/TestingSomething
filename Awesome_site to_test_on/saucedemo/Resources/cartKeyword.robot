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
    @{item_remove_btn}=    Get WebElements    xpath=//*[@class="btn btn_secondary btn_small cart_button"]
    # ${name}=    Get Text    ${item_name}[${num}]
    # ${num}=    Get Text    ${item_quantity}[${num}]
    # ${detail}=    Get Text    ${item_detail}[${num}]
    # ${price}=    Get Text    ${item_price}[${num}]
    # Log    ItemName : ${name}
    # Log    ItemQuantity : ${num}
    # Log    ItemDetail : ${detail}
    # Log    ItemPrice : ${price}
    # Log    ItemName : ${name}
    Element Should Be Enabled    ${item_remove_btn}[${num}]
CartRemoveItem
    [Arguments]    ${num}
    @{item_remove_btn}=    Get WebElements    xpath=//*[@class="btn btn_secondary btn_small cart_button"]
    Click Element    ${item_remove_btn}[${num}]
    #Page Should Contain Element    ${item_remove_btn}[${num}]
    Page Should Contain Element    ${cart_item_${num}}