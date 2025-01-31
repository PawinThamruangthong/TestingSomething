*** Settings ***
Library    SeleniumLibrary
Library    String
Resource   ${CURDIR}/keyword.robot
Test Setup    OpenWeb
#Test Teardown    Close Browser

*** Test Cases ***

Get Sample Title
    SelectApp    10
    Sleep    2s
GetTitle
    [Documentation]    Check Card Data
    GetAppData    1    title
    GetAppData    5    body
    GetAppData    15    title
    GetAppData    45    title
01 input
    [Tags]    Input
    [Documentation]    Input Check
    SelectApp    1
    SeeTxt                           Web inputs page for Automation Testing Practice
    Location                         https://practice.expandtesting.com/inputs
    1 Input    50    Text    passworddddd    12252025
    Click Element       ${1_input_show}
    SeeEle                           xpath=//*[@id="output-number"]
    2ElementSameText    ${1_num}     xpath=//*[@id="output-number"]
    2ElementSameText    ${1_txt}     xpath=//*[@id="output-text"]
    2ElementSameText    ${1_pwd}     xpath=//*[@id="output-password"]
    2ElementSameText    ${1_date}    xpath=//*[@id="output-date"]

02 Login
    [Tags]    Login
    SelectApp    2
    SeeTxt    Test Login page for Automation Testing Practice
    #Positive
    2 GetText
    2 GetData & Login
    SeeTxt      You logged into a secure area!
    Location    https://practice.expandtesting.com/secure
    Click Element    ${2_btn_logout}
    SeeEle    ${2_btn_login}
    #Negative
    2 Login    aaaaaaa    aaaaaaa
    Wait Until Element Contains    ${2_login_fail_noti}    Your username is invalid!
    2 Login    practice    aaaaaaa
    Wait Until Element Contains    ${2_login_fail_noti}    Your password is invalid!
