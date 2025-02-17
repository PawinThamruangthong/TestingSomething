*** Settings ***
Library           SeleniumLibrary
Library           OperatingSystem
Resource          ../Resources/uniKeyword.robot
Resource          ../Resources/transactionKeyword.robot
Test Setup        OpenWebBrowser
Test Teardown     Close Browser

*** Test Cases ***

VerifyAddress in Checkout
    [Tags]    Address    Checkout
    ClickSignUp
    SignUp    name1    aaa12209995aaaa48@gmail.com    09416989898    john    smith    apple    aaaaaaaaa    ${null}    India    aaaaaa    aaaaa    120000    0012345648989
    ClickBtn    ${logoutbtn}
    Login    aaa12209995aaaa48@gmail.com    09416989898
    Wait Until Page Contains    Logged in as name1    5s
    AddProduct
    ShouldSeeEle    ${product_check_out_btn}
    ClickBtn        ${product_check_out_btn}
    ShouldSeeText    Review Your Order
    VerifyMultipleString    john    smith    aaaaaaaaa    India    aaaaaa    aaaaa    120000    0012345648989
    AccountDelete2
    ShouldSeeText    AutomationExercise

DownloadInvoice
    [Tags]    Invoice    Directory
    [Setup]
    ${prefs} =    Create Dictionary    download.default_directory=${CURDIR}   
    OpenBrowser    ${url}    ${browser}    options=add_experimental_option("prefs",${prefs})
    ClickSignUp
    SignUp    name1    aaa09995aaaa48@gmail.com    09416989898    john    smith    apple    aaaaaaaaa    ${null}    India    aaaaaa    aaaaa    120000    0012345648989
    ClickBtn    ${logoutbtn}
    Login    aaa09995aaaa48@gmail.com    09416989898
    Wait Until Page Contains    Logged in as name1    5s
    AddProductForCheckOut(AlreadyLoggedin)
    ShouldSeeText    Payment
    PaymentInfo    aaaaaaaa    12345678910    596    12    99
    ShouldSeeText    Congratulations! Your order has been confirmed!
    ClickBtn    ${invoice_download}
    Wait Until Created    ${CURDIR}\\invoice.txt
    File Should Exist    ${CURDIR}\\invoice.txt
    Remove File    ${CURDIR}\\invoice.txt
    AccountDelete2
    ShouldSeeText    AutomationExercise

Register/Checkout
    [Tags]    Register    AccountDelete    Checkout    Product
    ClickBtn        ${product_btn}
    ShouldSeeEle    ${product_list}
    ClickBtn        ${product_1_add2cart}
    ShouldSeeEle    ${product_notify}
    VerifyMsg       ${product_notify}    Added!
    ClickBtn        ${product_notify_viewcart}
    ShouldSeeEle    ${product_check_out_btn}
    ClickBtn        ${product_check_out_btn}
    ShouldSeeEle    ${product_check_out}
    ClickBtn        ${product_check_out_register}
    SignUp    name1    aaa0999aa54558@gmail.com    09416989898    john    smith    apple    aaaaaaaaa    ${null}    India    aaaaaa    aaaaa    120000    0012345648989
    ClickBtn        ${cart}
    ShouldSeeEle    ${product_check_out_btn}
    ClickBtn        ${product_check_out_btn}
    ShouldSeeText    Review Your Order
    Input Text      ${order_comment}    aaaaaaaaaaaa
    ClickBtn        ${order_place_order}
    ShouldSeeText    Payment
    PaymentInfo    aaaaaaaa    12345678910    596    12    99
    ShouldSeeText    Congratulations! Your order has been confirmed!
    AccountDelete2
    ShouldSeeText    AutomationExercise
    
Register before Checkout
    [Tags]    Register    AccountDelete    Checkout    Product
    ClickSignUp
    SignUp    name1    aaa09995aaa48@gmail.com    09416989898    john    smith    apple    aaaaaaaaa    ${null}    India    aaaaaa    aaaaa    120000    0012345648989
    AddProductForCheckOut(AlreadyLoggedin)
    ShouldSeeText    Payment
    PaymentInfo    aaaaaaaa    12345678910    596    12    99
    ShouldSeeText    Congratulations! Your order has been confirmed!
    AccountDelete2
    ShouldSeeText    AutomationExercise

Login before CheckOut
    [Tags]    Register    Login    Logout    AccountDelete    Checkout    Product
    ClickSignUp
    SignUp    name1    aaa09995aaaa48888@gmail.com    09416989898    john    smith    apple    aaaaaaaaa    ${null}    India    aaaaaa    aaaaa    120000    0012345648989
    ClickBtn    ${logoutbtn}
    Login    aaa09995aaaa48888@gmail.com    09416989898
    Wait Until Page Contains    Logged in as name1    5s
    AddProductForCheckOut(AlreadyLoggedin)
    ShouldSeeText    Payment
    PaymentInfo    aaaaaaaa    12345678910    596    12    99
    ShouldSeeText    Congratulations! Your order has been confirmed!
    AccountDelete2
    ShouldSeeText    AutomationExercise