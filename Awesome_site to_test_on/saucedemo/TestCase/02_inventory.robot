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
    [Timeout]    3s
    [Teardown]    Run Keyword If Timeout Occurred    Pass Execution    Timeout
    Run Keyword And Ignore Error    Wait Until Page Contains    Products    0.5s
#######visual_user
visual_icon_cart
    [Setup]    VisualUser
    Wait Until Element Is Visible    id=shopping_cart_container
    ${elem}    Get Webelement    shopping_cart_container
    ${transform}    Call Method    ${elem}    value_of_css_property    transform
    ${top}    Call Method    ${elem}    value_of_css_property    top
    ${right}    Call Method    ${elem}    value_of_css_property    right
    Run Keyword And Expect Error    *    Should Be Equal As Strings    ${transform}    none
    Run Keyword And Expect Error    *    Should Be Equal As Strings    ${top}    10
    Run Keyword And Expect Error    *    Should Be Equal As Strings    ${right}    20
visual_icon_submenu
    [Setup]    VisualUser
    Wait Until Element Is Visible    id=shopping_cart_container
    ${elem}    Get Webelement    xpath=//*[@alt="Open Menu"]
    ${transform}    Call Method    ${elem}    value_of_css_property    transform
    Run Keyword And Expect Error    *    Should Be Equal As Strings    ${transform}    none
visual_icon_Addtocart
    [Setup]    VisualUser
    ${elem}    Get WebElement    xpath=//*[@data-test="add-to-cart-test.allthethings()-t-shirt-(red)"]
    Wait Until Element Is Visible    ${elem}
    ${transform}    Call Method    ${elem}    value_of_css_property    position
    Run Keyword And Expect Error    *    Should Be Equal As Strings    ${transform}    static