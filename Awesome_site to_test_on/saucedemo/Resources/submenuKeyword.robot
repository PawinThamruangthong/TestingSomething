*** Settings ***
Library    SeleniumLibrary
Resource    ../PageObject/variable.robot
Resource    ../Resources/loginKeyword.robot


*** Keywords ***
# Normal User
Submenu - CheckAll
    Submenu - about
    Go Back
    Submenu - Cart
    Submenu - Item
    Submenu - ResetApp
    Submenu - Logout
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
    Page Should Contain    Your Cart
SelectSubmenu
    [Arguments]    ${sub}
    Click Element    ${btn_submenu}
    Wait Until Element Is Visible    ${submenu_item_list}
    Click Element    ${${sub}}

# Problem user
Prob_Submenu - About
    Run Keyword And Expect Error    *    Submenu - about