*** Settings ***
Library                    SeleniumLibrary    plugins=shadowdom.py
Library                    String
Library                    OperatingSystem
Library                    geo.py
Resource                   ${CURDIR}/keyword.robot
Test Setup    OpenWebBrowser
Test Teardown    Close Browser

*** Test Cases ***

01 ALl Href In main page
    HrefCheck
02 Challenge2
    [Tags]    Input    Verify
    GotoChallenge
    OpenChallenge    2
    GetAns
    ShouldSeeTxt    Success
03 Challenge3
    [Tags]    Input
    OpenChallenge    3
    VerifyCh3
    Ch3Input    1111111111    2222222222    3333333333    4444444444
    Click Element    ${challenge_3_remove}
06 Challenge6
    [Tags]    New Tab
    OpenChallenge    6
    ShouldSeeEle    ${ch_6_new_tab}
    Click Element    ${ch_6_new_tab}
    #Get All Tab Data
    @{txt}=    Get Window Handles
    Switch Window    ${txt}[0]
    Switch Window    ${txt}[1]
07 Challenge7
    [Tags]    Pop-Up Window
    OpenChallenge    7
    ShouldSeeEle    ${challenge_7_open_btn}
    ShouldSeeEle    ${challenge_7_info}
    Element Should Contain    ${challenge_7_info}    Click to open pop-up
    Click Element    ${challenge_7_open_btn}
    #Get All Tab Data
    @{txt}=    Get Window Handles
    #Swtich Window
    Switch Window    ${txt}[1]
    #Verify Text
    ShouldSeeEle    ${challenge_7_popup_submit}
    Click Element    ${challenge_7_popup_submit}
    Switch Window    ${txt}[0]
    Wait Until Element Contains    ${challenge_7_info}    Button Clicked
08 Challenge8
    [Tags]    Iframe
    OpenChallenge    8
    #Select frame
    Select Frame    xpath=//*[@id="frame1"]
    Select Frame    xpath=//*[@id="frame2"]
    #Verify in selected frame
    ShouldSeeEle    ${challenge_8_click_me}
    Click Element    ${challenge_8_click_me}
    Element Should Contain    ${challenge_8)_message}    Button Clicked
09 Challenge9
    [Tags]    Shadow DOM    WIP
    OpenChallenge    9
    #Get Shadow DOM element
    ${btn}=    Get WebElement    dom:document.querySelector("body > main > div > progress-bar").shadowRoot.querySelector("div:nth-child(3) > button")
    Element Should Be Visible    ${btn}
    ShouldSeeEle    ${challenge_9_guage}
    #Check Guage Attribute
    AttCheck    5
    Click Element    ${btn}
    #Try Keyword Until Succedds    Time   frequency  keyword   keyworldvalue
    Wait Until Keyword Succeeds    10s    200ms    AttCheck    95
10 Challenge10
    [Tags]    Rating
    OpenChallenge    10
    SelectStar    1
    SelectStar    2
    SelectStar    3
    SelectStar    4
    SelectStar    5
11 Challenge11
    [Tags]    Scroll
    OpenChallenge    11
    Element Should Contain    ${ch11_info}    Click the button below
    Scroll Element Into View    ${ch11_btn}
    Click Element    ${ch11_btn}
    Scroll Element Into View    ${ch11_info}
    Element Should Contain    ${ch11_info}    Mission accomplished
12 Challenge12
    [Tags]    Upload    File
    OpenChallenge    12
    ShouldSeeEle    ${ch12_num_file}
    Element Should Contain    ${ch12_num_file}    No File Selected
    #UploadFile
    Choose File    ${ch12_input_btn}    ${CURDIR}\\ginger.png
    Wait Until Element Contains    ${ch12_file_name_display}    ginger.png
13 Challenge13
    [Tags]    Downlaod    File
    [Setup]
    #Set Download Location
    ${prefs} =    Create Dictionary    download.default_directory=${CURDIR}
    #Open Browser with Condition
    OpenBrowser    ${url}    ${browser}    options=add_experimental_option("prefs",${prefs})
    OpenChallenge    13
    ShouldSeeEle    ${ch13_downlaod}
    Click Element    ${ch13_downlaod}
    #Checking file condition
    Wait Until Created    ${CURDIR}\\sample.pdf
    File Should Exist    ${CURDIR}\\sample.pdf
    Remove File    ${CURDIR}\\sample.pdf
# 14 Challenge14
#     [Tags]    Popup    XXXX
#     OpenChallenge    14
#     ShouldSeeEle     ${ch14_welcome}
#     Element Should Contain    ${ch14_welcome}    Welcome on board!
#     ShouldSeeEle    ${ch14_button}
#     Click Element    ${ch14_button}
#     Wait Until Page Contains  Welcome Peter Parker! 🕷🎉
#     Sleep    3s
#     ShouldSeeEle    ${ch14_content}
#     Click Element    ${ch14_button}
#     ShouldSeeEle     ${ch14_welcome}
15 Challnege15 Entry
    [Tags]    Entry    Table    #NEED element to automatically update
    OpenChallenge    15
    #AddNewEntry
    NewEntry
    #CheckRow ###NO NEED
    RowCount
    #Log    ${elem}[0]
    NewEntry
    NewEntry
    #Add Text
    Input Text    xpath=//*[@id="app"]/table/tbody[1]/tr[2]/td[4]/input    55
    #Delete Row
    Click Element    xpath=//*[@id="app"]/table/tbody[1]/tr[2]/td[5]
    Click Element    xpath=//*[@id="app"]/table/tbody[1]/tr[2]/td[5]
    RowCount
# 16 Challenge16 RightClick
#     [Tags]    Click    SubMenu
#     [Documentation]    NeedSelectableSubMenu2    NeedRightClickLocation
#     OpenChallenge    16
#     Element Should Contain    ${ch16_btn}    Open Right-Click Context Menu
#     # SelectMenu    1
#     SelectMenu    2
#     SelectMenu    3
#     SelectMenu    4
#     SelectMenu    5
#     SelectMenu    6
17 Hover
    [Tags]    Hover    Verify
    OpenChallenge    17
    ShouldSeeEle    ${ch17_pic}
    #Move Mouse Over Element
    Mouse Over    ${ch17_pic}
    ShouldSeeEle    ${ch17_desc}
    ShouldSeeEle    ${ch17_crnt_price}
    ShouldSeeEle    ${ch17_old_price}
    #Get Text From Element
    ${txt}=    Get Text    ${ch17_crnt_price}
    ${txt2}=    Get Text    ${ch17_old_price}
    ${desc}=    Get Text    ${ch17_desc}
    Log    Current Price is ${txt}.
    Log    Old Price is ${txt2}.
    Log    Description is ${desc}
18 Geolocation
    [Tags]    Location    GeoLocation
    #Set location
    ${latitude}=    Convert To Number    37.33182
    ${longtitude}=    Convert To Number    -122.03118
    ${accuracy}=    Convert To Number    100
    #Use geo.py to set location of browser
    set geolocation  ${latitude}    ${longtitude}    ${accuracy}
    OpenChallenge    18
    Click Element    ${ch18_get_location_btn}
    Wait Until Element Contains    ${ch18_get_location_info}    Cupertino

19 Naviagetion Menu
    [Tags]    Link    Navigatation
    OpenChallenge    19
    ShouldSeeEle    ${ch19_home_btn}
    19ElemCount    0
    19ElemCount    1
    Go Back
    19ElemCount    2
    Go Back
    19ElemCount    3
    Go Back
    19ElemCount    4
    Go Back
20 Redirect
    [Tags]    Redirection    WIP
    OpenChallenge    20
    Wait Until Location Is    https://qaplayground.dev/apps/redirect/
    ShouldSeeEle    ${ch20_btn}
    Click Element    ${ch20_btn}
    Wait Until Page Contains    second
    20GetText
    Wait Until Page Contains    third
    20GetText 
    Wait Until Page Contains    fourth
    20GetText
    Wait Until Page Contains    fifth
    20GetText
    Wait Until Page Contains    sixth
    20GetText
    Wait Until Page Contains    last
    20GetText
    ShouldSeeEle    ${ch20_btn_go_back}
    Click Element    ${ch20_btn_go_back}
21 FetchData
    [Tags]     Fetching
    OpenChallenge    21
    21GetSpecifictext    2    title
    21GetSpecifictext    2    body
22 QR Code
    [Tags]    QR
    OpenChallenge    22
    ${qr_result}=    CreateQR    Helloworld
    OpenGoogleLens
    ${qr_text}=    LensSearch    ${qr_result}[0]
    Should Be Equal As Strings    ${qr_result}[1]    ${qr_text}
23 CountDown
    [Tags]    Iframe
    OpenChallenge    23
    Select Frame    id=frame1
    #Get Text When Element Contain 53
    ${txt}=    23CheckCountdownElement    53
    Log    ${txt}
    #Get Text When Condown Complete
    ${txt2}=    23CountdownComplete
    Should Be Equal As Strings    ${txt2}    This is the end of the journey
24 Slider
    [Tags]    Slider
    OpenChallenge    24
    ShouldSeeEle    xpath=/html/body/div/div[2]/div[1]
    24Input    50
    ShouldSeeEle    ${ch24_feedback_btn}
    Click Element    ${ch24_feedback_btn}
    ShouldSeeEle    ${ch24_msg}
    Element Should Contain    ${ch24_msg}    Thank you for your feedback!
    