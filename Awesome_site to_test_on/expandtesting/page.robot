*** Settings ***
Library    SeleniumLibrary
Library    String
Library    OperatingSystem
Library    geo.py
Library    Collections
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
#20 Cypress spies sutbs clocks Not Robot
21 Dom
    [Tags]    Dom
    SelectApp    21
    ${btn}    Get WebElements    xpath=/html/body/main/div[3]/div/div[1]/div/div[1]/a
    ${num}=    CountElements    xpath=/html/body/main/div[3]/div/div[1]/div/div[1]/a
    ${label1}=    Get Text    ${btn}[0]
    ${label2}=    Get Text    ${btn}[1]
    ${label3}=    Get Text    ${btn}[2]
23 ShadowDom
    [Tags]    ShadowDom    Dom
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

27 InfiniteScroll
    [Tags]    Scroll
    SelectApp    27
    SeeTxt    Infinite Scroll page for Automation Testing Practice
    Repeat Keyword    10s    GenParagraph

28 SlowResorce
    [Tags]    Slow    Loading
    SelectApp    28
    Wait Until Element Is Not Visible    ${loading_circle}    20
    Wait Until Element Is Visible    ${task_msg}
    Element Should Contain    ${task_msg}    The slow task has finished. Thanks for waiting!

29 JS Dialogs
    [Tags]    Alert    JavaScript
    SelectApp    29
    Click Element    ${js_alert}
    Handle Alert    ACCEPT
    VerifyEleMsg    dialog-response    OK
    Click Element    ${js_confirm}
    Handle Alert    ACCEPT
    VerifyEleMsg    dialog-response    Ok
    Click Element    ${js_confirm}
    Handle Alert    DISMISS
    VerifyEleMsg    dialog-response    Cancel
    Click Element    ${js_prompt}
    Input Text Into Alert    AAA
    Click Element    ${js_prompt}
    Handle Alert    DISMISS
    VerifyEleMsg    dialog-response    ${EMPTY}

31 JQuery UI
    [Tags]    JavaScript
    SelectApp    31
    Click Element    ${31_js_menu_link}
32 UIMenu
    [Tags]    Hover
    [Setup]    OpenWebForDownloadFile
    SelectApp    32
    # Sub1    2
    # Location Should Be    https://practice.expandtesting.com/jqueryui
    # Go Back
    # Wait Until Location Is    https://practice.expandtesting.com/jqueryui/menu
    Sub2    1    1
    Sub2    1    2
    Sub2    1    3
33 A/B Test
    [Tags]    A/B
    SelectApp    33
    Wait Until Element Contains    xpath=/html/body/main/div[3]/div/h1    A/B Test Variation 1 page for Automation Testing Practice
    Go To    https://practice.expandtesting.com/abtest?abtest_off=true
    Wait Until Element Contains    xpath=/html/body/main/div[3]/div/h1    No A/B Test page for Automation Testing Practice
34 Checkbox
    [Tags]    Checkbox
    Set Selenium Speed    1s
    SelectApp    34
    SeeEle    ${checkbox_1}
    Select Checkbox    ${checkbox_1}
    Checkbox Should Be Selected    ${checkbox_1}
    Unselect Checkbox    ${checkbox_1}
    Checkbox Should Not Be Selected    ${checkbox_1}
    Select Checkbox    ${checkbox_2}
    Checkbox Should Be Selected    ${checkbox_2}
    Unselect Checkbox    ${checkbox_2}
    Checkbox Should Not Be Selected    ${checkbox_2}
35 ContextMenu
    [Tags]    Context
    SelectApp    35
    Open Context Menu    id=hot-spot
    Alert Should Be Present    You selected a context menu
36 Keypress
    [Tags]    KeyPress
    SelectApp    36
    PressKeyAndVerify    L
    PressKeyAndVerify    M
    PressKeyAndVerify    A
    PressKeyAndVerify    C
37 ElementDisappearing
    [Tags]    element    disappear
    SelectApp    37
    Repeat Keyword    5 times    CheckElem
38 ContextMenu2
    [Tags]    Context
    SelectApp    38
    Open Context Menu    id=hot-spot
    Alert Should Be Present    You selected a context menu
39 Dropdown
    [Tags]    DropDown
    SelectApp    39
    Select From List By Value    dropdown    1
    Select From List By Index    elementsPerPageSelect    2
    Select From List By Label    country    Aruba
41 Geo
    [Tags]    Geo
    ${latitude}=      Convert To Number    37.33182
    ${longtitude}=    Convert To Number    -122.03118
    ${accuracy}=      Convert To Number    100
    #Use geo.py to set location of browser
    set geolocation  ${latitude}    ${longtitude}    ${accuracy}
    SelectApp    41
    Click Element    ${geo_btn}
42 Slider
    [Tags]    Slider
    SelectApp    42
    #Drag And Drop By Offset    xpath=/html/body/main/div[3]/div/div/input    10    0
    Repeat Keyword    5    42Input    Add
    Repeat Keyword    4    42Input    Sub
43 Hover
    [Tags]    Hover
    SelectApp    43
    43GetEle    1
    43GetEle    2
    43GetEle    3
44 floatingMenu
    [Tags]    Flaoting
    SelectApp    44
    SeeEle    ${floating_menu}
    Scroll Element Into View    xpath=/html/body/footer
    SeeEle    ${floating_menu}
45 Iframe
    [Tags]    Iframe
    SelectApp    45
    SeeTxt          External IFrame: TinyMCE Editor
    # First IFrame
    Select Frame    mce_0_ifr
    Input     xpath=//*[@id="tinymce"]    inputtexttesting
    Unselect Frame
    SeeTxt    Internal IFrame: Email Subscription
    # Second IFrame
    Select Frame    email-subscribe
    SeeTxt    Send updates to my inbox ...
    #Negative
    Input     id=email    aaaaaaaaaaa
    Click Element    ${45_btn}
    SeeEle                    //*[@id="subscription-form"]/div/div
    Element Should Contain    //*[@id="subscription-form"]/div/div    Please enter a valid email address.
    #Positive
    Input                     id=email    aaaaa@gmail.com
    Click Element    ${45_btn}
    SeeEle                    id=success-message
    Element Should Contain    id=success-message    You are now subscribed!
46 NewTab
    [Tags]    Window
    SelectApp    46
    Click Element    xpath=/html/body/main/div[3]/div/div/a
    @{txt}=              Get Window Handles
    Switch Window    ${txt}[1]
    SeeTxt    Example of a new window page for Automation Testing Practice
    Switch Window    ${txt}[0]
    SeeTxt    Opening a new window page for Automation Testing Practice
47 ListSorting
    [Tags]    List    Sorting
    SelectApp    47
    #No Class
        # support 1 - 5 only
    47Checklist-Noclass    2
    47Checklist-Noclass    3
    #47Checklist    4    ?
    47Checklist-Noclass    5
    #Class
    #47SortingTable(Class)    dues
    47SortingTable(Class)    last-name
    47SortingTable(Class)    first-name
    47SortingTable(Class)    email
    47SortingTable(Class)    web-site
48 ToolTips
    [Tags]    Tooltips
    SelectApp    48
    HoverBtn    1    top
    HoverBtn    2    end
    HoverBtn    3    bottom
    HoverBtn    4    start
    HoverBtn    5    html
50 Dynamic Control
    [Tags]    Dynamic    Control    Checkbox
    SelectApp    50
    SeeTxt    Dynamic Controls
    #CheckBox
    50 Dynamic Checkbox(dis)
    50 Dynamic Checkbox(add)
50-2 Dynamic Control
    [Tags]    Dynamic    Control    TextArea
    Select App    50
    SeeTxt    Dynamic Control
    #TextArea
    50 TxtEnable
    50 TxtDisable
51 Dynamic Loading
    [Tags]    Dynamic    Loading    Hidden    Render
    SelectApp    51
    SeeTxt    Dynamically Loaded Page Elements
    51Pre-render Element 
    Go Back
    51Post-render Element 
52 Shifting Content - Menu
    [Tags]    Shifting
    SelectApp    52
    #SelectContnet > menu, image, list
    52 SelectContent    menu
    52 SetAttwithLink
    52 SetAttwithURL    25
52 Shifting Content - list
    SelectApp    52
    52 SelectContent    list
    @{data_list}=    52-List Get_List
    Reload Page
    @{data_list2}=    52-List Get_List
    List Should Contain Sub List    ${data_list}    ${data_list2}
54 Dynamic ID
    SelectApp    54
    ${id_before}=    Get Element Attribute    xpath=//*[@class="btn btn-primary"]    id
    Reload Page
    ${id_after}=     Get Element Attribute    xpath=//*[@class="btn btn-primary"]    id
    Should Not Be Equal    ${id_before}    ${id_after}
55 Entry Ad
    SelectApp    55
    #modal window
    Wait Until Element Is Visible    xpath=//*[@class="modal-body"]
    ${element}=    Get WebElement    xpath=//*[@class="modal-body"]
    ${txt}=    Get Text    ${element}
    Element Should Contain    ${element}    It's commonly used to encourage a user to take an action 
    ...    (e.g., give their e-mail address to sign up for something or disable their ad blocker).

58 Google Tracking Events
    SelectApp    58
    Event_Click_1
    Event_Click_2
    Event_Submit
    Event_Conver
    Event_Scroll
59 Sample User Profile
    SelectApp    59

61 Scrollbars
    SelectApp    61
    Set Focus To Element    xpath=/html/body/main/div[3]/div/div/div/div
    Scroll Element Into View    ${61_target}
    Click Element    ${61_target}
62 Cookie Consent Alert
    SelectApp    62
    Element Should Be Visible    id=js-cookie-box
    Click Element    id=js-cookie-button
    Element Should Not Be Visible    id=js-cookie-box
# 63 Https Header
#     SelectApp    63
64 Log
    SelectApp    64
    Btn_log
    Log To Console    A