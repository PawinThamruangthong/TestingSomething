*** Settings ***
Library           SeleniumLibrary
Resource          ../Resources/accountKeyword.robot
Resource          ../Resources/cartKeyword.robot
Resource          ../Resources/product.robot
Test Setup        OpenWebBrowser
Test Teardown     Close Browser

*** Test Cases ***


AddProduct
    [Tags]    Product    Cart
    ClickBtn        ${product_btn}
    ShouldSeeEle    ${product_list}
    ClickBtn        ${product_1_add2cart}
    ShouldSeeEle    ${product_notify}
    VerifyMsg       ${product_notify}    Your product has been added to cart.
    ClickBtn        ${product_notify_continue}
    ClickBtn        ${product_2_add2cart}
    ShouldSeeEle    ${product_notify}
    VerifyMsg       ${product_notify}    Added!
    ClickBtn        ${product_notify_viewcart}
    VerifyMultipleString    Blue Top    Men Tshirt
    VerifyPrice    ${product_1_price}    ${product_1_quan}    ${product_1_total}

ProductQuantity
    [Tags]    Product    Cart
    ClickBtn    ${product_btn}
    ShouldSeeEle    ${product_list}
    ViewProduct
    VerifyQuantity    4

Remove Product from Cart
    [Tags]    Product    Remove
    AddProduct
    ClickBtn    ${product_remove}
    Wait Until Element Contains    ${cart_info}    Cart is empty! Click here to buy products.
    
SearchProductAndVerifyCartAfterLogin
    [Tags]    Product    Cart    Login
    ClickBtn    ${product_btn}
    SearchProduct    Embroidered    Dress
    AddProductNew    1
    AddProductNew    2
    ClickBtn    ${cart}
    VerifyMultipleString    Cotton Mull Embroidered Dress    Rose Pink Embroidered Maxi Dress
    #### SIGN UP #####
    ClickSignUp
    SignUp    name1    aaa09995aaaa448@gmail.com    09416989898    john    smith    apple    aaaaaaaaa    ${null}    India    aaaaaa    aaaaa    120000    0012345648989
    ClickBtn    ${logoutbtn}
    Login    aaa09995aaaa448@gmail.com    09416989898
    Wait Until Page Contains    Logged in as name1    5s
    #####
    ClickBtn    ${cart}
    VerifyMultipleString    Cotton Mull Embroidered Dress    Rose Pink Embroidered Maxi Dress
    AccountDelete2

