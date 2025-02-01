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
    Input Text     ${locator}    ${text}
SelectApp
    [Arguments]    ${num}
    ${num}=         Evaluate    ${num}-1
    @{element}=     Get WebElements    //*[@class="my-link"]
    #${txt}=    Get WebElements    ${element}[0]
    ${link}=        Get WebElements    ${element}[${num}]
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
VerifyEleMsg
    [Arguments]    ${ele}    ${txt}
    Wait Until Element Contains    ${ele}    ${txt}
#1
1 Input
    [Arguments]    ${num}    ${txt}    ${pwd}    ${date}
    SeeEle   ${1_num}
    Input    ${1_num}     ${num}
    Input    ${1_txt}     ${txt}
    Input    ${1_pwd}     ${pwd}
    Input    ${1_date}    ${date}
2ElementSameText
    [Arguments]             ${locator1}    ${locator2}
    ${txt1}=    Get Value   ${locator1}
    ${txt2}=    Get Text    ${locator2}
    Should Be Equal         ${txt1}    ${txt2}

#2
2 GetText
    ${username}=    Get Text        ${2_given_id}
    ${username}=    Strip String    ${username}            mode=left    characters='Username: '
    ${password}=    Get Text        ${2_given_password}
    ${password}=    Strip String    ${password}            mode=left    characters='Password: '
    RETURN    ${username}    ${password}
2 GetData & Login
    @{account}=    2 GetText
    Input Text        ${2_input_id}          ${account}[0]
    Input Text        ${2_input_password}    ${account}[1]
    Click Button      ${2_btn_login}
Login
    [Arguments]    ${id}    ${pwd}
    Input Text        ${2_input_id}          ${id}
    Input Text        ${2_input_password}    ${pwd}
    Click Button      ${2_btn_login}

#3
Register
    [Arguments]    ${name}    ${password}    ${confirmpassword}
    Input Text    ${regis_username}    ${name}
    Input Text    ${regis_password}    ${password}
    Input Text    ${regis_comfirm_password}    ${confirmpassword}
    Click Element    ${regis_submit}
    RETURN    ${name}    ${password}

#5
Otp Email
    [Arguments]    ${email}    ${otp}
    Input    ${otp_email}    ${email}
    Click Element    ${otp_request}
    SeeEle    ${otp_input}
    Input    ${otp_input}      ${otp}
    Click Element    ${otp_verify}
GetDataFromPage
    ${email}=    Get Text    xpath=/html/body/main/div[3]/div/div[1]/div/ul/li[1]
    ${otp}=    Get Text    xpath=/html/body/main/div[3]/div/div[1]/div/ul/li[2]
    ${email}=    Strip String    ${email}    mode=left    characters=Email Address: 
    ${otp}=    Strip String    ${otp}    mode=left    characters=OTP Code: 
    RETURN    ${email}    ${otp}

#6
ReturnTextFromTable
    [Arguments]    ${x}    ${y}
    ${txt}=    Get Text    xpath=/html/body/main/div[3]/div/div[2]/div/div[2]/table/tbody/tr[${x}]/td[${y}]
    RETURN    ${txt}
CheckText
    [Arguments]    ${txt}    
    Element Should Contain    ${txt}    Chrome
    RETURN    ${txt}
CheckChrome
    [Arguments]    ${txt}
    IF    ${txt == '%word'}
        RETURN    ${txt}
    END
GetData
    [Arguments]    ${task_name}    ${resource}
    ${row}=        GetRow    ${task_name}
    ${column}=     GetColumn    ${resource}
    RETURN    ${row}    ${column}
GetRow
    [Arguments]    ${task_name}
    ${txt2}=    Convert To String    ${task_name}
    FOR    ${i}    IN RANGE    1    5
    #                          xpath=/html/body/main/div[3]/div/div[2]/div/div[2]/table/tbody/tr[1]/td[1]
        Log    i=${i}
        ${txt}=    Get Text    xpath=/html/body/main/div[3]/div/div[2]/div/div[2]/table/tbody/tr[${i}]/td[1]
        #IF    ${txt=='Chrome'}
        #${${txt2}==${txt}}
        ${checkkeyword}=    Run Keyword And Return Status    Should Be Equal As Strings    ${txt2}    ${txt}
        IF    ${checkkeyword}
            ${row}=    Get Variable Value    ${i}
            Log   ${row}
            RETURN    ${row}
            BREAK
        ELSE
            Continue For Loop
        END
    END
GetColumn
    [Arguments]    ${resource}
    FOR    ${i}    IN RANGE    1    6
        ${Col_name}=    Get Text    xpath=/html/body/main/div[3]/div/div[2]/div/div[2]/table/thead/tr/th[${i}]
        ${checkkeyword}=    Run Keyword And Return Status    Should Be Equal As Strings    ${Col_name}    ${resource}
        IF    ${checkkeyword}
            ${row}=    Get Variable Value    ${i}
            Log   ${row}
            RETURN    ${row}
            BREAK
        END
    END
    