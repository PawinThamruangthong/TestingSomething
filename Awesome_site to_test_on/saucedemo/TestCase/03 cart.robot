*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/cartKeyword.robot
Test Setup    CartSetUp


*** Test Cases ***

Default
    Page Should Contain    Your Cart

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
    Page Should Contain Element    xpath=//*[@class="cart_item"]
    SelectSubmenu    resetApp
    Reload Page
    Page Should Not Contain Element    xpath=//*[@class="cart_item"]
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
