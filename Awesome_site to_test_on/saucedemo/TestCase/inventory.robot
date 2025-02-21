*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/inventoryPage.robot
Test Setup    NormalUser

*** Test Cases ***
#Normal User
Default
    Location Should Be    https://www.saucedemo.com/inventory.html
ElementCheck
    Element Should Be Visible    ${btn_submenu}
    Element Should Be Visible    ${btn_cart}
    Element Should Be Visible    ${btn_sort}
Submenu
#${allitem},${about},${logout},${resetApp}
    SelectSubmenu    about
    Location Should Be    https://saucelabs.com/
    Go Back
    SelectSubmenu    resetApp
    Click Element    ${btn_cart}
    SelectSubmenu    allitem
    Location Should Be    https://www.saucedemo.com/inventory.html
    SelectSubmenu    logout
    Location Should Be    https://www.saucedemo.com/
    NotLoggedIn
CartBtn
    Click Element    ${btn_cart}
    Location Should Be    https://www.saucedemo.com/cart.html
Sort
    # az za lohi hilo
    CheckList    az
    CheckList    za


