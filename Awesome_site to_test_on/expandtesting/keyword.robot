*** Settings ***
Library                    SeleniumLibrary
Library                    String
Resource                   ${CURDIR}/variable.robot

*** Keywords ***

OpenWeb
    Open Browser    ${url}    ${brw}
    SeeTxt    Practice Test Automation Website for Web UI & API
SeeTxt
    [Arguments]    ${txt}
    Wait Until Page Contains    ${txt}
SeeEle
    [Arguments]    ${ele}
    Wait Until Element Is Visible    ${ele}
Input
    [Arguments]    ${locator}    ${text}
    Input Text    ${locator}    ${text}
SelectApp
    [Arguments]    ${num}
    ${num}=    Evaluate    ${num}-1
    @{element}=    Get WebElements    //*[@class="my-link"]
    #${txt}=    Get WebElements    ${element}[0]
    ${link}=    Get WebElements    ${element}[${num}]
    # ${txt}=    Get Text    ${word}
    Click Element    ${link}
GetAppData
    [Arguments]    ${num}    ${body}
    ${num}=    Evaluate    ${num}-1
    #Get Elements From Class
    IF    ${body=="title"}
        @{element}=    Get WebElements    //*[@class="card-title expand-card-title"]
        ${title}=    Convert To String    Title
    ELSE IF    ${body=="body"}
        @{element}=    Get WebElements    //*[@class="card-text"]
        ${title}=    Convert To String    Body
    END
    #Get Selected Element From Elements
    ${word}=    Get WebElements    ${element}[${num}]
    #Get Text From Elements
    ${txt}=    Get Text    ${word}
    #Log
    Log    ${title} = ${txt}
Location
    #Check Current URL
    [Arguments]    ${url}
    Location Should Be    ${url}
#1
1 Input
    [Arguments]    ${num}    ${txt}    ${pwd}    ${date}
    SeeEle    ${1_num}
    Input    ${1_num}    ${num}
    Input    ${1_txt}    ${txt}
    Input    ${1_pwd}    ${pwd}
    Input    ${1_date}    ${date}
2ElementSameText
    [Arguments]    ${locator1}    ${locator2}
    ${txt1}=    Get Value   ${locator1}
    ${txt2}=    Get Text    ${locator2}
    Should Be Equal    ${txt1}    ${txt2}

#2
2 GetText
    ${username}=    Get Text    ${2_given_id}
    ${username}=    Strip String    ${username}   mode=left    characters='Username: '
    ${password}=    Get Text    ${2_given_password}
    ${password}=    Strip String    ${password}    mode=left    characters='Password: '
    RETURN    ${username}    ${password}
2 GetData & Login
    @{account}=    2 GetText
    Input Text    ${2_input_id}    ${account}[0]
    Input Text    ${2_input_password}    ${account}[1]
    Click Button    ${2_btn_login}
2 Login
    [Arguments]    ${id}    ${pwd}
    Input Text    ${2_input_id}    ${id}
    Input Text    ${2_input_password}    ${pwd}
    Click Button    ${2_btn_login}
