*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/inventoryKeyword.robot
Test Setup    NormalUser

*** Test Cases ***
########Normal User
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
########problem_user
problem_Submenu_about
    [Setup]    ProblemUser
    [Tags]    Fail
    Prob_Submenu - About
problem_Submenu_logout
    [Setup]    ProblemUser
    [Tags]    Fail
    Submenu - Logout
problem_Sort
    [Setup]    ProblemUser
    [Tags]    Fail
    Run Keyword And Expect Error    *    CheckList    za
problem_item_picture
    [Setup]    ProblemUser
    [Tags]    Fail
    Run Keyword And Expect Error    *    Element Attribute Value Should Be    xpath=//*[@id="item_4_img_link"]/img    
    ...    src    https://www.saucedemo.com/static/media/sauce-backpack-1200x1500.0a0b85a3.jpg
problem_add/deleteitem
    [Setup]    ProblemUser
    [Tags]    Fail
    GetitemBtn    1
    GetitemBtn    2
    RemoveitemBtn    0
    RemoveitemBtn    0
    Run Keyword And Expect Error    *    Page Should Not Contain Element    xpath=//*[@class="btn btn_secondary btn_small btn_inventory "]
problem_href
    [Setup]    ProblemUser
    hrefCheck
########performance_user
performance_default
    [Tags]    Fail
    [Setup]    PerformanceGlitchUser
    [Timeout]    5s
    Page Should Contain    Products