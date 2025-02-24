*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/cartKeyword.robot
Test Setup    CartSetUp


*** Test Cases ***

Default
    Page Should Contain    Your Cart
Submenu
    Submenu - CheckAll
Cart - Continue Shopping
    Click Button    ${btn_continue_shopping}
    Location Should Be    https://www.saucedemo.com/inventory.html
Cart - CheckOut
    Click Button    ${btn_checkout}
    Location Should Be    https://www.saucedemo.com/checkout-step-one.html
Cart - Detail
    CartItem Detail    0
    CartItem Detail    1
Cart - RemoveItem
    CartRemoveItem    1
    CartRemoveItem    0
