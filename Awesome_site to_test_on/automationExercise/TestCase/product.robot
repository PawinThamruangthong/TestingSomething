*** Settings ***
Library           SeleniumLibrary
Resource          ../Resources/product.robot
Test Setup        OpenWebBrowser
Test Teardown     Close Browser

*** Test Cases ***
VerifyProduct
    [Tags]    Product
    ClickBtn        ${product_btn}
    Location Should Be    https://www.automationexercise.com/products
    ShouldSeeEle    ${product_list}
    ViewProduct

SearchProduct
    [Tags]    Product
    ClickBtn    ${product_btn}
    Location Should Be    https://www.automationexercise.com/products
    SearchProduct    Green    Green
    SearchProduct    Red    Rose Pink

View Category Products
    [Tags]    Product    Category
    ClickBtn    ${product_btn}
    ShouldSeeEle    ${category_main}
    ClickBtn    ${woman_expand}
    ShouldSeeEle    ${woman_sub}
    SelectSubCatGender    Women    1
    ShouldSeeText    Women - Dress Products
    ClickBtn    ${men_expand}
    ShouldSeeEle    ${men_sub}
    SelectSubCatGender    Men    1
    ShouldSeeText    Men - Tshirts Products

View Products Brand
    [Tags]    Product    Brand    ****NOTCLEAR****
    ClickBtn    ${product_btn}
    SelectSubCatBrand    3
    SelectSubCatBrand2    2
    SelectSubCatBrand2    4
    SelectSubCatBrand2    1
    SelectSubCatBrand2    2
    SelectSubCatBrand2    3
    
AddReviewOnProduct
    [Tags]    Review    Product
    ClickBtn    ${product_btn}
    Review    name    testemail@gmail.com    reviewtext
    Wait Until Page Contains   Thank you for your review.