*** Settings ***
Library                    SeleniumLibrary
Library                    OperatingSystem
Resource                   ${CURDIR}/keyword.robot
Test Setup        OpenWebBrowser
Test Teardown     Close Browser
*** Test Cases ***
01 SignUp + DeleteAccount
    [Tags]    Login    Register    AccountDelete    Positive    12 20 1
    ClickSignUp
    SignUp    name1    aaa0999548@gmail.com    09416989898    john    smith    apple    aaaaaaaaa    ${null}    India    aaaaaa    aaaaa    120000    0012345648989
    AccountDelete2
02 Login/Register Fail
    [Tags]    Login    Register    Negative
    ClickSignUp
    Login        aaaa@gmail.com    111111
    VerifyMsg    ${login_error}           Your email or password is incorrect!
    Register     aaa@gmail.com     aaaaa
    VerifyMsg    ${register_error_msg}    Email Address already exist!
03 Contact Us
    [Tags]    ContactUs
    OpenContactUs
    ContactUsInput
    Choose File    ${git_upload}    ${git_file} 
    ClickBtn       ${git_submit}
    Handle Alert    ACCEPT
    VerifyMsg      ${git_upload_msg}    Success! Your details have been submitted successfully.
    ClickBtn       ${git_home_btn}
    Wait Until Page Contains   AutomationExercise
04 TestCasePage
    [Tags]    TestCase
    ClickBtn    ${testcase_btn}
    Location Should Be    https://www.automationexercise.com/test_cases
05 VerifyProduct
    [Tags]    Product
    ClickBtn        ${product_btn}
    Location Should Be    https://www.automationexercise.com/products
    ShouldSeeEle    ${product_list}
    ViewProduct
06 SearchProduct
    [Tags]    Product
    ClickBtn    ${product_btn}
    Location Should Be    https://www.automationexercise.com/products
    SearchProduct    Green    Green
    SearchProduct    Red    Rose Pink
07 VerifySubScribtion
    [Tags]    Subscribe    HomePage    CartPage    Scroll
    #Home
    VerifySubScription
    #Cart
    ClickBtn    ${cart}
    VerifySubScription
08 AddProduct
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
09 ProductQuantity
    [Tags]    Product    Cart
     ClickBtn    ${product_btn}
    ShouldSeeEle    ${product_list}
    ViewProduct
    VerifyQuantity    4
10 Register/Checkout
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

11 Register before Checkout
    [Tags]    Register    AccountDelete    Checkout    Product
    ClickSignUp
    SignUp    name1    aaa09995aaa48@gmail.com    09416989898    john    smith    apple    aaaaaaaaa    ${null}    India    aaaaaa    aaaaa    120000    0012345648989
    AddProductForCheckOut(AlreadyLoggedin)
    ShouldSeeText    Payment
    PaymentInfo    aaaaaaaa    12345678910    596    12    99
    ShouldSeeText    Congratulations! Your order has been confirmed!
    AccountDelete2
    ShouldSeeText    AutomationExercise

12 Login before CheckOut
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

13 Remove Product from Cart
    [Tags]    Product    Remove
    AddProduct
    ClickBtn    ${product_remove}
    Wait Until Element Contains    ${cart_info}    Cart is empty! Click here to buy products.

14 View Category Products
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

15 View Products Brand
    [Tags]    Product    Brand    ****NOTCLEAR****
    ClickBtn    ${product_btn}
    SelectSubCatBrand    3
    SelectSubCatBrand2    2
    SelectSubCatBrand2    4
    SelectSubCatBrand2    1
    SelectSubCatBrand2    2
    SelectSubCatBrand2    3

16 SearchProductAndVerifyCartAfterLogin
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
17 AddReviewOnProduct
    [Tags]    Review    Product
    ClickBtn    ${product_btn}
    Review    name    testemail@gmail.com    reviewtext
    Wait Until Page Contains   Thank you for your review.
18 Recommeded Item
    [Tags]    Recommend    Scroll
    Scroll Element Into View    ${product_recommend}
    Wait Until Element Is Visible    ${product_recommend_item}
    ClickBtn    ${product_recommend_item}
    Wait Until Element Is Visible    ${product_notify}
    ClickBtn    ${product_notify_viewcart}
    ShouldSeeText    Summer White Top
19 VerifyAddress in Checkout
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
20 DownloadInvoice
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
21 ScrollDown
    [Tags]    Scroll
    Scroll Element Into View    ${home_subscribtion}
    ShouldSeeEle    ${home_subscribtion}
    ClickBtn    ${icon_arrow}
    ShouldSeeText    AutomationExercise
22 ScrollUp
    [Tags]    Scroll
    Scroll Element Into View    ${home_subscribtion}
    ShouldSeeEle    ${home_subscribtion}
    Scroll Element Into View    ${testcase_btn}
    ShouldSeeText    AutomationExercise