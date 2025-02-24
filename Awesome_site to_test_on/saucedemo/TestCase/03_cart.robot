*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/cartKeyword.robot
Test Setup    CartSetUp


*** Test Cases ***
# Normal User
Default
    Page Should Contain    Your Cart
Submenu
    Submenu - CheckAll
Href
    hrefCheck
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

#Problem User
Default_prob
    [Setup]    problem_CartSetup
    Page Should Contain    Cart
problem_reset
    [Setup]    problem_CartSetup
    Submenu - ResetApp
problem - Continue
    [Setup]    problem_CartSetup
    Click Button    ${btn_continue_shopping}
    Location Should Be    https://www.saucedemo.com/inventory.html
problem - CheckOut
    [Setup]    problem_CartSetup
    Click Button    ${btn_checkout}
    Location Should Be    https://www.saucedemo.com/checkout-step-one.html
problem - href
    [Setup]    problem_CartSetup
    hrefCheck