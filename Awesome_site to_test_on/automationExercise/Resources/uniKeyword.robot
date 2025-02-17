*** Settings ***
Library                    SeleniumLibrary
Library                    String
Resource                   ../PageObjects/variable.robot

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
OpenContactUs
    ShouldSeeEle     ${contactus}
    Click Element    ${contactus}
    ShouldSeeText    Below contact form is for testing purpose.
ContactUsInput
    Input Text    ${git_name}        AAAAAA
    Input Text    ${git_email}       AAAA@gmail.com
    Input Text    ${git_subject}     AAAAAAA
    Input Text    ${git_msg}         AAAAAAAAAAAAAAAAAAAA3
VerifyMultipleString
    [Arguments]    @{Array}
    FOR    ${Item}    IN    @{Array}
        Log    ${item}
        #Page Should Contain    ${item}
        Wait Until Page Contains   ${Item}
    END

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
