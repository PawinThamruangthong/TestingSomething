*** Settings ***
Library           SeleniumLibrary
Resource          ../Resources/uniKeyword.robot

Test Setup        OpenWebBrowser
Test Teardown     Close Browser


*** Test Cases ***
Contact Us
    [Tags]    ContactUs
    OpenContactUs
    ContactUsInput
    Choose File    ${git_upload}    ${CURDIR}\\1.txt
    ClickBtn       ${git_submit}
    Handle Alert    ACCEPT
    VerifyMsg      ${git_upload_msg}    Success! Your details have been submitted successfully.
    ClickBtn       ${git_home_btn}
    Wait Until Page Contains   AutomationExercise
TestCasePage
    [Tags]    TestCase
    ClickBtn    ${testcase_btn}
    Location Should Be    https://www.automationexercise.com/test_cases

VerifySubScribtion
    [Tags]    Subscribe    HomePage    CartPage    Scroll
    #Home
    VerifySubScription
    #Cart
    ClickBtn    ${cart}
    VerifySubScription

Recommeded Item
    [Tags]    Recommend    Scroll
    Scroll Element Into View    ${product_recommend}
    Wait Until Element Is Visible    ${product_recommend_item}
    ClickBtn    ${product_recommend_item}
    Wait Until Element Is Visible    ${product_notify}
    ClickBtn    ${product_notify_viewcart}
    ShouldSeeText    Summer White Top

ScrollDown
    [Tags]    Scroll
    Scroll Element Into View    ${home_subscribtion}
    ShouldSeeEle    ${home_subscribtion}
    ClickBtn    ${icon_arrow}
    ShouldSeeText    AutomationExercise

ScrollUp
    [Tags]    Scroll
    Scroll Element Into View    ${home_subscribtion}
    ShouldSeeEle    ${home_subscribtion}
    Scroll Element Into View    ${testcase_btn}
    ShouldSeeText    AutomationExercise