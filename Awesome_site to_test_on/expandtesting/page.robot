*** Settings ***
Library    SeleniumLibrary
Library    String
Library    OperatingSystem
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
    1 Input                          50    Text    passworddddd    12252025
    Click Element       ${1_input_show}
    SeeEle                           xpath=//*[@id="output-number"]
    2ElementSameText    ${1_num}     xpath=//*[@id="output-number"]
    2ElementSameText    ${1_txt}     xpath=//*[@id="output-text"]
    2ElementSameText    ${1_pwd}     xpath=//*[@id="output-password"]
    2ElementSameText    ${1_date}    xpath=//*[@id="output-date"]

02 Login
    [Tags]       Login
    SelectApp    2
    SeeTxt       Test Login page for Automation Testing Practice
    #Positive
    2 GetText
    2 GetData & Login
    SeeTxt       You logged into a secure area!
    Location     https://practice.expandtesting.com/secure
    Click Element    ${2_btn_logout}
    SeeEle           ${2_btn_login}
    #Negative
    Login        aaaaaaa    aaaaaaa
    VerifyEleMsg    ${2_login_fail_noti}    Your username is invalid!
    Login        practice    aaaaaaa
    VerifyEleMsg    ${2_login_fail_noti}    Your password is invalid!

03 Register
    [Tags]        Register
    SelectApp     3
    SeeTxt        Test Register page for Automation Testing Practice
    #Negative
    @{account}=         Register    Username    Password    Password
    VerifyEleMsg        ${regis_noti}                    An error occurred during registration. Please try again.
    Register            Username    ${EMPTY}    ${EMPTY}
    VerifyEleMsg        ${regis_noti}                    All fields are required.
    Register            Username    1111111    22222222
    VerifyEleMsg        ${regis_noti}                    Passwords do not match.
    #Positive
    ${id}=              Generate Random String    12
    ${pwd}=             Generate Random String    12
    Register            ${id}    ${pwd}    ${pwd}
    VerifyEleMsg        ${regis_noti}                    Successfully registered, you can log in now.
    Login               ${id}    ${pwd}
    VerifyEleMsg        ${regis_noti}                    You logged into a secure area!
    ${txt}=    Get Text    xpath=//*[@id="username"]
    ${id_lowercase}=    Convert To Lower Case    ${id}
    VerifyEleMsg    id=username    Hi, ${id_lowercase}!
    Location            https://practice.expandtesting.com/secure
    Click Element       ${2_btn_logout}
    SeeEle              ${2_btn_login}

04 Forgot Password
    [Tags]    Password
    SelectApp    4
    #Negative
        #ErrorMsg In Element
    Input    email    aaaaaaa
    Click Element    ${forgot_submit}
    VerifyEleMsg     ${forgot_error}    Please enter a valid email address.
        #ErrorMsg In Notify
    Input    email    aaaaaaa@gmail
    Click Element    ${forgot_submit}
    VerifyEleMsg     ${noti}    Your email is invalid!
    #Positive
    Input    email    aaaaaa@gmail.com
    Click Element    ${forgot_submit}
    SeeEle           ${fotgot_confirm}
    VerifyEleMsg     ${fotgot_confirm}    An e-mail has been sent to you which explains how to reset your password.

05 OTP
    [Tags]    OTP
    SelectApp    5
    #Negative
        #incorrect OTP
    Otp Email    aaaaaaa@gmail.com    5555
    VerifyEleMsg    ${otp_msg}    The provided OTP code is incorrect. Please check your code and try again.
    Go Back
    Go Back
        #invalid email
    Input    ${otp_email}    aaaaaaa
    Click Element    ${otp_request}
    VerifyEleMsg     ${otp_email_error}    Please enter a valid email address.
    #Positive
    @{account}=    GetDataFromPage
    Otp Email    ${account}[0]    ${account}[1]}
    VerifyEleMsg        ${regis_noti}                    You logged into a secure area!
06 Dynamic Table
    [Tags]    Dynamic
    SelectApp    6
    #Get position of target data
    @{data_pos}=    GetData    Firefox    CPU
    #Use data's position to get text from table
    ${result}=    ReturnTextFromTable    ${data_pos}[0]    ${data_pos}[1]
    Log    You Get ${result}
07 Basic Auth
    [Tags]    Authentication
    [Setup]    Open Browser    https://admin:admin@practice.expandtesting.com/basic-auth    ${brw}
    SeeTxt    Congratulations! You must have the proper credentials.
08 Digest Auth
    [Tags]    Authentication
    [Setup]    Open Browser    https://admin:admin@practice.expandtesting.com/basic-auth    ${brw}
    SeeTxt    Congratulations! You must have the proper credentials.
09 Browser Info
    [Tags]    Browser    Information
    SelectApp    9
    SeeEle    ${show_brw_info}
    Click Element    ${show_brw_info}
    SeeEle    id=browser-info
10 RadioBtn
    [Tags]    Radio
    SelectApp    10
    SeeTxt    Radio Buttons page for Automation Testing Practice
    Select Radio Button    color    black
    Select Radio Button    sport    football
11 DragNDrop
    [Tags]    Drag    Drop
    SelectApp    11
    Drag And Drop    ${box_a}    ${box_b}
12 StackDragNDrop
    [Tags]    Drag    Drop    Stacking
    SelectApp    12
    DragToTarget    red
    DragToTarget    green
    DragToTarget    blue
13 FormValidation
    [Tags]    Validation
    SelectApp    13
    #   Positive
    InputValidate    John    012-3456789    02202025    card
    ValidatePass
    Go Back
    Reload Page
    #    Negative
    #NameError
    InputValidate    ${EMPTY}    012-3456789    02202025    card
    VerifyEleMsg    ${cont_err_name}    Please enter your Contact name.
    Reload Page
    #ContactNumber
    InputValidate    John    ${EMPTY}    02202025    card
    VerifyEleMsg    ${cont_err_num}    Please provide your Contact number.
    Reload Page
    InputValidate    John    123456789    02202025    card
    VerifyEleMsg    ${cont_err_num}    Please provide your Contact number.
    Reload Page
    #PickUp Date
    InputValidate    John    012-3456789    ${EMPTY}    card
    VerifyEleMsg    ${cont_err_pick}    Please provide valid Date.
    Reload Page
    #Method
    InputValidate    John     012-3456789    02202025    ${EMPTY}
14 Upload
    SelectApp    14
    SeeEle                  ${upload_section}
    #UploadFile
    Choose File             ${upload_section}    ${CURDIR}\\upload.txt
    Click Element           ${upload_btn}
    SeeTxt    File Uploaded!
15 Download
    [Setup]
    #Set Download Location
    ${prefs} =        Create Dictionary    download.default_directory=${CURDIR}
    #Open Browser with Condition
    OpenBrowser       ${url}    ${brw}    options=add_experimental_option("prefs",${prefs})
    SelectApp    15
    downloadFile
    Wait Until Created    ${CURDIR}\\some-file.json
    File Should Exist     ${CURDIR}\\some-file.json
    Remove File           ${CURDIR}\\some-file.json
16 Add/Remove Element
    SelectApp    16
    AddElements    5
    AddElements    10
    DeleteElements    10
    DeleteElements    10
17 SecuredFile
    [Setup]    Open Browser    https://admin:admin@practice.expandtesting.com/download-secure    ${brw}
    SeeTxt    File Downloader page for Automation Testing Practice
18 NotiMsg
    SelectApp    18
    Click Noti And Verify
    Repeat Keyword    5    Click Noti And Verify
19 AutoComplete
    SelectApp    19
    Input    ${country}    A
    ${txtlower}=    Convert To Lower Case    A
    ${txtupper}=    Convert To Upper Case    A
    ${verify}=    Create List    ${txtlower}    ${txtupper}
    #Wait To see suggestion list
    Wait Until Element Is Visible    ${country_list}
    #Get All element of suggestion list
    @{txt_list}=    Get WebElements    xpath=//*[@id="countryautocomplete-list"]/div
    #Check condition : every element should contain keyword from input
    FOR    ${item}    IN    @{txt_list}
        ${txt}=    Get Text    ${item}
        Should Contain Any    ${txt}    ${txtlower}    ${txtupper}
    END
    #Click first option
    Click Element    ${txt_list}[0]
23 ShadowDom
    [Tags]    ShadowDom
    SelectApp    23
    SeeTxt    Shadow DOM page for Automation Testing Practice
    SeeEle    ${normal_btn}
    ${btn}=                       Get WebElement    dom:document.querySelector("#shadow-host").shadowRoot.querySelector("#my-btn")
    SeeEle    ${btn}
24 Typos
    [Tags]    Typo
    SelectApp    24
    CheckTypo    ${msg_txt}    Sometimes you'll see a typo, other times you won't.
    Reload Page
    CheckTypo    ${msg_txt}    Sometimes you'll see a typo, other times you won't.
    Reload Page
    CheckTypo    ${msg_txt}    Sometimes you'll see a typo, other times you won't.
26 BrokenImg
    [Tags]    Image
    SelectApp    26
    VerifyImg    /html/body/main/div[3]/div/div/div[1]/img
    VerifyImg    /html/body/main/div[3]/div/div/div[2]/img
    VerifyImg    xpath=//html/body/main/div[3]/div/div/div[3]/img
    