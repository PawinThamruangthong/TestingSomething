*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/inventoryKeyword.robot
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
    Submenu - CheckAll
Href
    hrefCheck
Sort
    # az za lohi hilo
    #Name Sort
    CheckList    az
    CheckList    za
    #Price Sort
    # CheckList    lohi
    # CheckList    hilo
AddTocart
    GetitemBtn    1
    GetitemBtn    2
RemoveFromCart
    #N: able to delete specific item
    GetitemBtn    1
    GetitemBtn    2
    RemoveitemBtn    0
    RemoveitemBtn    0
