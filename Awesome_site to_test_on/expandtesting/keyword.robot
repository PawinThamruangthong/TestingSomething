*** Settings ***
Library                    SeleniumLibrary
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
    @{element}=    Get WebElements    //*[@class="card-title expand-card-title"]
    #${txt}=    Get WebElements    ${element}[0]
    ${word}=    Get WebElements    ${element}[${num}]
    ${txt}=    Get Text    ${word}
#1
1 Input
    [Arguments]    ${num}    ${txt}    ${pwd}    ${date}
    SeeEle    ${1_num}
    Input    ${1_num}    ${num}
    Input    ${1_txt}    ${txt}
    Input    ${1_pwd}    ${pwd}
    Input    ${1_date}    ${date}