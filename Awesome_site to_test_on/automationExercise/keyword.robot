*** Settings ***
Library                    SeleniumLibrary
Library                    String
Resource                   ${CURDIR}/variable.robot

*** Keywords ***

OpenWebBrowser
    Open Browser    ${url}    ${browser}
    Wait Until Page Contains   AutomationExercise
ShouldSeeEle
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}
ShouldSeeText
    [Arguments]    ${txt}
    Wait Until Page Contains    ${txt}
ClickBtn
    [Arguments]      ${btn}
    Wait Until Element Is Visible    ${btn}
    Click Element    ${btn}
ClickSignUp
    ClickBtn    ${loginbtn}
    Wait Until Page Contains    New User Signup!
VerifyMsg
    [Arguments]    ${locator}    ${verimsg}
    Wait Until Element Is Visible    ${locator}
    ${msg}=    get Text    ${locator}
    Element Should Contain    ${locator}    ${msg}
Register
    [Arguments]    ${email}    ${name}
    Input Text     ${register_name}    ${name}
    Input Text     ${register_email}    ${email}
    ClickBtn       ${register_btn}
    
SignUp
    [Arguments]    ${name}    ${email}    ${password}    ${ifname}    ${ilname}    ${icompany}    
    ...    ${iaddress1}    ${iaddress2}    ${icountry}    ${istate}    ${icity}    ${izipcode}    ${imobile}
    Input Text      ${register_name}    ${name}
    Input Text      ${register_email}    ${email}
    Click Button    ${register_btn}
    Wait Until Page Contains    Title
    Click Element     ${radio_title_female}
    Input Text        ${register_password}    ${password}
    Select From List By Value     ${dropdown_day}      1
    Select From List By Index     ${dropdown_month}    3
    Select From List By Value     ${dropown_year}      1998 
    Input Text                    ${firstname}     ${ifname}
    Input Text                    ${lastname}      ${ilname}
    Input Text                    ${company}       ${icompany}
    Input Text                    ${address1}      ${iaddress1}
    Input Text                    ${address2}      ${iaddress2}
    Select From List By Value     ${country}       ${icountry}
    Input Text                    ${state}         ${istate}
    Input Text                    ${city}          ${icity}
    Input Text                    ${zipcode}       ${izipcode}
    Input Text                    ${mobile}        ${imobile}
    ClickBtn                    ${btn_createAccount}
    Wait Until Page Contains    Account Created!    5s
    ClickBtn                    ${btn_CreateAccountcontinue}
    Wait Until Page Contains    Logged in as ${name}    5s

AccountDelete
    ClickBtn                    ${btn_accdelete}
    Wait Until Page Contains    Account Deleted!    5s
    ClickBtn                    ${btn_accdeletecontinue}
    Wait Until Page Contains    AutomationExercise
AccountDelete2
    ClickBtn                    ${btn_accdelete}
    Wait Until Page Contains    Account Deleted!    5s
    ClickBtn                    ${btn_accdel2}
    Wait Until Page Contains    AutomationExercise
Login
    [Arguments]    ${username}    ${password}
    Input Text     ${login_email}    ${username}
    Input Text     ${login_password}    ${password}
    ClickBtn       ${acc_login_btn}
OpenContactUs
    ShouldSeeEle     ${contactus}
    Click Element    ${contactus}
    ShouldSeeText    Below contact form is for testing purpose.
ContactUsInput
    Input Text    ${git_name}        AAAAAA
    Input Text    ${git_email}       AAAA@gmail.com
    Input Text    ${git_subject}     AAAAAAA
    Input Text    ${git_msg}         AAAAAAAAAAAAAAAAAAAA3
PaymentInfo
    [Arguments]    ${name}    ${card}    ${cvc}    ${mm}    ${yy}
    Input Text    ${payment_name}    ${name}
    Input Text    ${payment_card_num}    ${card}
    Input Text    ${payment_card_cvc}    ${cvc}
    Input Text    ${payment_card_mm}    ${mm}
    Input Text    ${payment_card_yy}    ${yy}
    ClickBtn      ${payment_confirm_btn}


VerifyMultipleString
    [Arguments]    @{Array}
    FOR    ${Item}    IN    @{Array}
        Log    ${item}
        #Page Should Contain    ${item}
        Wait Until Page Contains   ${Item}
    END

SelectSubCatGender
    [Arguments]    ${gender}    ${number}
    ${txt}=    Get WebElement    css=#${gender} > div > ul > li:nth-child(${number}) > a
    Click Element    ${txt}
SelectSubCatBrand
    [Arguments]    ${brand}
    ShouldSeeEle    ${brand_main}
    ${label}=    Get WebElement   xpath=/html/body/section/div/div/div[1]/div/div[2]/div/ul/li[1]/a
    Click Element    ${label}
SelectSubCatBrand2
    [Arguments]    ${brand}
    ShouldSeeEle    ${brand_main}
    ${label}=    Get WebElement   xpath=/html/body/section/div/div[2]/div[1]/div/div[2]/div/ul/li[${brand}]/a
    Click Element    ${label}
    
ViewProduct
    ClickBtn    ${viewproduct_btn}
    Location Should Be    https://www.automationexercise.com/product_details/1
    VerifyMultipleString    Blue Top    Category    Rs. 500    Availability    Condition    Brand
SearchProduct
    [Arguments]    ${keyword}           ${expected_result_keyword}
    Input Text     ${product_search}    ${keyword}
    Click Element  ${product_search_btn}
    Wait Until Page Contains            ${expected_result_keyword}
AddProduct
    ClickBtn        ${product_btn}
    ShouldSeeEle    ${product_list}
    ClickBtn        ${product_1_add2cart}
    ShouldSeeEle    ${product_notify}
    VerifyMsg       ${product_notify}    Added!
    ClickBtn        ${product_notify_viewcart}
AddProductNew
    [Arguments]     ${number}
    ClickBtn        ${product_${number}_add2cart}
    ShouldSeeEle    ${product_notify}
    VerifyMsg       ${product_notify}    Added!
    ClickBtn        ${product_notify_continue}
AddProductForCheckOut(AlreadyLoggedin)
    AddProduct
    ShouldSeeEle    ${product_check_out_btn}
    ClickBtn        ${product_check_out_btn}
    ShouldSeeText    Review Your Order
    Input Text      ${order_comment}    aaaaaaaaaaaa
    ClickBtn        ${order_place_order}
VerifyQuantity
    [Arguments]     ${InputQuantity}
    Input Text      ${product_quantity_increase}    ${InputQuantity}
    Click Button    ${product_quantity_add2cart}
    ShouldSeeEle    ${product_notify_viewcart}
    ClickBtn        ${product_notify_viewcart}
    ${ShowQuan}=    GetNumberFromElement(Nostring)    ${product_1_quan}
    Should Be Equal As Numbers    ${InputQuantity}    ${ShowQuan}
VerifyPrice
    [Arguments]    ${Price}    ${Quantity}    ${total}
    ${txtPrice}=    GetPriceFromElement(with Rs.)        ${Price}
    ${quantitynum}=    GetNumberFromElement(Nostring)    ${Quantity}
    ${totalResult}=    GetPriceFromElement(with Rs.)     ${Price}
    ${totalNum}=    GetPriceFromElement(with Rs.)        ${total}
    Should Be Equal As Numbers    ${totalResult}         ${totalNum}
GetPriceFromElement(with Rs.)
    [Arguments]                      ${element}
    ${txt}    Get Text               ${element}
    ${txt}=    Remove String         ${txt}    Rs. 
    ${num}=    Convert To Number     ${txt}
    RETURN    ${num}
GetNumberFromElement(Nostring)
    [Arguments]            ${element}
    ${txt}    Get Text     ${element}
    ${num}=    Convert To Number    ${txt}
    RETURN    ${num}
VerifySubScription
    Scroll Element Into View     ${home_subscribtion}
    Element Should Be Visible    ${home_subscribtion}
    Input Text                   ${subscribtion_email}    aaaa@gmail.com
    ClickBtn                     ${subscribtion_go}
    ShouldSeeEle                 ${subscribtion_alert}

Review
    [Arguments]    ${name}    ${email}    ${text}
    ShouldSeeEle    ${viewproduct_btn}
    ClickBtn    ${viewproduct_btn}
    ShouldSeeText    Write Your Review
    Input Text    ${product_review_name}    AAAAAAA
    Input Text    ${product_review_email}    aaaaa@gmail.com
    Input Text    ${product_review_text}    aaaaaaaaaaaaaaaa
    ClickBtn    ${product_review_submit}
