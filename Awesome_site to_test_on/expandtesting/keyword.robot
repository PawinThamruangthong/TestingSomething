*** Settings ***
Library                    SeleniumLibrary
Library                    Collections
Library                    OperatingSystem
Library                    String
Resource                   ${CURDIR}/variable.robot

*** Keywords ***

OpenWeb
    Open Browser    ${url}    ${brw}
    SeeTxt    Practice Test Automation Website for Web UI & API
OpenWebForDownloadFile
    ${prefs} =        Create Dictionary    download.default_directory=${CURDIR}
    #Open Browser with Condition
    OpenBrowser       ${url}    ${brw}    options=add_experimental_option("prefs",${prefs})
CheckDownloadAndRemoveFile
    [Arguments]    ${filename}
        Wait Until Created    ${CURDIR}\\${filename}
        File Should Exist     ${CURDIR}\\${filename}
        Remove File           ${CURDIR}\\${filename}
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
        ${title}=      Convert To String    Title
    ELSE IF    ${body=="body"}
        @{element}=    Get WebElements    //*[@class="card-text"]
        ${title}=      Convert To String    Body
    END
    #Get Selected Element From Elements
    ${word}=    Get WebElements    ${element}[${num}]
    #Get Text From Elements
    ${txt}=     Get Text           ${word}
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
    Should Be Equal         ${txt1}        ${txt2}

#2
2 GetText
    ${username}=    Get Text        ${2_given_id}
    #                                 target                left = only leftside until find the characters
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
    Input Text    ${regis_username}            ${name}
    Input Text    ${regis_password}            ${password}
    Input Text    ${regis_comfirm_password}    ${confirmpassword}
    Click Element    ${regis_submit}
    RETURN        ${name}    ${password}

#5
Otp Email
    [Arguments]    ${email}    ${otp}
    Input            ${otp_email}    ${email}
    Click Element    ${otp_request}
    SeeEle           ${otp_input}
    Input            ${otp_input}      ${otp}
    Click Element    ${otp_verify}
GetDataFromPage
    ${email}=        Get Text        xpath=/html/body/main/div[3]/div/div[1]/div/ul/li[1]
    ${otp}=          Get Text        xpath=/html/body/main/div[3]/div/div[1]/div/ul/li[2]
    ${email}=        Strip String    ${email}    mode=left    characters=Email Address: 
    ${otp}=          Strip String    ${otp}      mode=left    characters=OTP Code: 
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
    ${row}=        GetRow       ${task_name}
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
        #    Get Status for IF condition
        ${checkkeyword}=    Run Keyword And Return Status    Should Be Equal As Strings    ${txt2}    ${txt}
        IF    ${checkkeyword}
            ${row}=    Get Variable Value    ${i}
            Log       ${row}
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
        #    Get Status for IF condition
        ${checkkeyword}=    Run Keyword And Return Status    Should Be Equal As Strings    ${Col_name}    ${resource}
        IF    ${checkkeyword}
            ${row}=    Get Variable Value    ${i}
            Log   ${row}
            RETURN    ${row}
            BREAK
        END
    END

#12
DragToTarget
    [Arguments]    ${color}
    ${select_color}=    Get WebElement    //*[@class="${color}"]
    Drag And Drop    ${select_color}    ${Drop_target}
    
#13
InputValidate
    [Arguments]    ${name}    ${mobile}    ${date}    ${payment}
    Input    ${cont_name}    ${name}
    Input    ${cont_num}    ${mobile}
    Input    ${cont_pick}    ${date}
    #${rrr}=        Run Keyword And Return Status    ${result} 
    Run Keyword If    '${payment}' in ['cashondelivery','card']    Select From List By Value    ${cont_paym}    ${payment}
    #Select From List By Value    ${cont_paym}    ${payment}
    Click Element    ${cont_regis}
ValidatePass
    Wait Until Element Contains   ${cont_alert}    Thank you for validating your ticket

#15
downloadFile
    ${target_File}=    Get WebElement    xpath=//@href="download/some-file.json
    SeeEle    ${target_File}
    Click Element    ${target_File}

#16
AddElement
    Click Element    ${element_add}
AddElements
    [Arguments]    ${num}
    # Run keyword n time(s)
    Repeat Keyword    ${num}    Addelement
CountElements
    #Count all elements that have the same locator.
    [Arguments]    ${elementpath}
    ${num}=    Get Element Count    ${elementpath}
    RETURN    ${num}
DeleteElements
    #Click At specific element do delete it.
    [Arguments]    ${location}
    ${num}=    Convert To Integer    ${location}
    @{elem}=    Get WebElements    //*[@class="added-manually btn btn-info"]
    Click Element    ${elem}[${num}]

#18
Click Noti And Verify
    #Check If msg get from page is in the selected msg
    @{msg}=    Create List    Action successful    Action unsuccessful    please try again
    Click Element    ${noti_btn}
    SeeEle    ${noti}
    ${txt}=    Get Text    ${noti}
    Run Keyword If    '${txt}' in @{msg}    LogNoti    ${txt}
LogNoti
    [Arguments]    ${txt}
    Log    ${txt}

#24
CheckTypo
    [Arguments]    ${locator}    ${expected_text}    
    ${txt}=    Get Text    ${locator}
    
    ${condition}=    Run Keyword And Return Status    Should Be Equal As Strings    ${txt}    ${expected_text}
    IF    ${condition}
        Log    As expect
    ELSE
        Log    Typo
    END

#26
VerifyImg
    [Arguments]    ${locator}
    # Check Locator Should Visible
    ${condition}=    Run Keyword And Return Status    Page Should Contain Image    ${locator}
    IF    ${condition}
        #Get Source
        ${src}=    Get Element Attribute    ${locator}    src
        Go To    ${src}
        #Check Image Show Propery
        Wait Until Element Is Visible     css: img
        Go Back
        Log    Display Corectly
    ELSE
        Log    Image Error
    END
    
#27
GenParagraph
    @{Elem}=    Get WebElements    xpath=/html/body/main/div[3]/div/div/div/div
    ${num}=    CountElements    xpath=/html/body/main/div[3]/div/div/div/div/div
    Log    ${num} :Paragraph generated
    MovetoBtm
MovetoBtm
    Scroll Element Into View    ${btm_container}

#32
GetSubmenu
    [Arguments]    ${element}
    @{Elem}=    Get WebElements    ${element}
    FOR    ${item}    IN    @{Elem}
        ${txt}=    Get Text    ${item}
    END
    ${num}=    Get Element Count    ${element}

    RETURN    ${num}
Sub1
    [Arguments]    ${key}    
    Click Element   ${32_enable}
    IF    ${key=='1'}
        Mouse Over    id=ui-id-4
    ELSE IF    ${key=='2'}
        Click Element    id=ui-id-5
    ELSE
        Fail    Not have that menu
    END
Sub2
    [Arguments]    ${key}    ${key2}
    Sub1    ${key}
    Wait Until Element Is Visible    id=ui-id-6
    IF    ${key2=='1'}
        Click Element    id=ui-id-6
        CheckDownloadAndRemoveFile    menu.pdf
    ELSE IF    ${key2=='2'}
        Click Element    id=ui-id-7
        CheckDownloadAndRemoveFile    menu.csv
    ELSE IF    ${key2=='3'}
        Click Element    id=ui-id-8
        CheckDownloadAndRemoveFile    menu.xls
    ELSE
        Fail    Not have that menu
    END    

#36
PressKeyAndVerify
    [Arguments]    ${key}
    Press Key    id=target    ${key}
    SeeEle    ${key_result}
    ${result_txt}=    Get Text    ${key_result}
    ${txt}=    Strip String    ${result_txt}    mode=left    characters=You entered:
    Should Be Equal As Strings    ${key}    ${txt}

#37
DisappearElem_count
    #count all element that have the same xpath
    ${all_elem}=    Get Element Count    xpath=/html/body/main/div[3]/div/div/div/button
    RETURN    ${all_elem}
CheckElem
    SeeTxt    Disappearing Elements page for Automation Testing Practice
    ${elem_before}=    DisappearElem_count
    Reload Page
    ${elem_after}=    DisappearElem_count
    #Check if number of elements before reload are the same as after
    ${con}=    Run Keyword And Return Status    Should Be Equal    ${elem_before}    ${elem_after}
    IF    ${con}
        Log    Element remain the same
    ELSE    
        Log    Elemet disappering/reappearing
    END

#42
42Input
    [Arguments]    ${action}
    [Documentation]    checkInput
    # For Check element arttributes
    # ${css}=         Get WebElement    xpath://*[@onchange="showValue(this.value)"]
    # ${val_max}=    Get Element Attribute    ${css}    max
    # ${val_step}=    Get Element Attribute    ${css}    step
    # ${crnt}=    Get Text    id=range
    # ${crnt_val}=    Convert To Number    ${crnt}
    # ${max_val}=    Convert To Number    ${val_max}
    # ${val_step}=    Convert To Number    ${val_step}
    IF    ${action=='Add'}
        Set Focus To Element    ${horizon_slider}
        Press Key        ${horizon_slider}    \ue013
    ELSE IF    ${action=='Sub'}
        Set Focus To Element    ${horizon_slider}
        Press Key        ${horizon_slider}    \ue015
    ELSE
        Fail    Not supported method
    END
#43
43GetEle
    [Arguments]    ${num}
    #Hover mouse over element
    Mouse Over    xpath=/html/body/main/div[3]/div/div[${num}]/img
    #Get element
    ${name}=    Get WebElement    xpath=/html/body/main/div[3]/div/div[${num}]/div/h5
    ${prof_href}=    Get WebElement    xpath=/html/body/main/div[3]/div/div[${num}]/div/a
    SeeEle    ${name}
    #Get data from element
    ${name_txt}=    Get Text    ${name}
    ${href}=    Get Element Attribute    ${prof_href}    href
    #Verify element
    Should Be Equal As Strings    ${name_txt}    name: user${num}
    Should Be Equal As Strings    ${href}    https://practice.expandtesting.com/users/${num}
    Click Element    ${prof_href}
    SeeTxt    Welcome user${num}
    Go Back

#47
47GetList-Noclass
    [Arguments]    ${tab}
    #Can Get 1 - 5
    @{data_list}=    Create List
    ${elem_head}=    Get WebElement    xpath=//*[@id="table1"]/thead/tr/th[${tab}]
    @{elem_body}=    Get WebElements    xpath=//*[@id="table1"]/tbody/tr[*]/td[${tab}]
    ${body_count}=    CountElements    xpath=//*[@id="table1"]/tbody/tr[*]/td[${tab}]
    FOR    ${i}    IN RANGE    0    4
        ${txt}=    Get Text    ${elem_body}[${i}]
        Append To List    ${data_list}    ${txt}
    END
    RETURN    @{data_list}
47Sort-Noclass
    [Arguments]    ${tab}
    ${elem_head}=    Get WebElement    xpath=//*[@id="table1"]/thead/tr/th[${tab}]
    Click Element    ${elem_head}
47Checklist-Noclass
    [Arguments]    ${tab}
    @{list1}=    47GetList-Noclass    ${tab}
    47Sort-Noclass    ${tab}
    @{list2}=    47GetList-Noclass    ${tab}
    Sort List    ${list1}
    @{sortedList}=    47List Sorting    @{list1}
    Lists Should Be Equal    ${sortedList}    ${list2}
47List Sorting
    [Arguments]    @{list}
    @{data}=    Create List
    FOR    ${word}    IN    @{list}
        Append To List    ${data}    ${word}
    END
    RETURN    @{data}
#
47GetList-Class
    [Arguments]    ${class}
    @{data_list}=    Create List
    @{elems}=    Get WebElements    xpath=//td[@class="${class}"]
    FOR    ${elem}    IN    @{elems}
        ${txt}=    Get Text    ${elem}
        Append To List    ${data_list}    ${txt}
    END
    RETURN    @{data_list}
47Sort-Class
    [Arguments]    ${class}
    Click Element    xpath=//span[@class="${class}"]
47SortingTable(Class)
    [Arguments]    ${class}
    @{list1}=    47GetList-Class    ${class}
    47Sort-Class    ${class}
    @{list2}=    47GetList-Class    ${class}
    Log List    ${list1}
    IF    ${class=='dues'}
        #${list3}=    47RemoveStringFromList    ${list1}
        No Operation
    ELSE
        Sort List    ${list1}
        Log List    ${list1}
        Lists Should Be Equal    ${list1}    ${list2}
    END
#48
HoverBtn
    [Arguments]    ${btn}    ${pos}
    Mouse Over    id=btn${btn}
    ${tooltips}=    Get WebElement    xpath=//div[@class="tooltip-inner"]
    ${txt}=    Get Text    ${tooltips}
    Log    Tooltip : ${txt}
#50
50 Dynamic Checkbox(dis)
    SeeEle    ${50_chkbox}
    Element Should Be Enabled    ${50_chkbox}
    Click Element    ${50_chkbox_rmv}
    SeeEle    ${50_loading}
    ${complete_loading}=    Wait Until Element Is Not Visible    ${50_loading}
    ${chk_ele}=    Element Should Not Be Visible    ${50_chkbox}
    Run Keyword If    ${complete_loading}    ${chk_ele}
50 Dynamic Checkbox(add)
    Element Should Not Be Visible    ${50_chkbox}
    Click Element    ${50_chkbox_rmv}
    SeeEle    ${50_loading}
    ${complete_loading}=    Wait Until Element Is Not Visible    ${50_loading}
    ${chk_ele}=    Element Should Be Visible    ${50_chkbox}
    Run Keyword If    ${complete_loading}    ${chk_ele}
50 TxtEnable
    Element Should Be Disabled    ${50_input_area}
    Click Element    ${50_input_area_add/rmv}
    SeeEle    ${50_loading}
    ${complete_loading}=    Wait Until Element Is Not Visible    ${50_loading}
    ${chk_ele}=    Element Should Be Enabled    ${50_input_area}
    Run Keyword If    ${complete_loading}    ${chk_ele}
    Input    ${50_input_area}    Test
50 TxtDisable
    Element Should Be Enabled    ${50_input_area}
    Click Element    ${50_input_area_add/rmv}
    SeeEle    ${50_loading}
    ${complete_loading}=    Wait Until Element Is Not Visible    ${50_loading}
    ${chk_ele}=    Element Should Be Disabled    ${50_input_area}
    Run Keyword If    ${complete_loading}    ${chk_ele}
    #Get Keyword Status And Verify Result
    ${50_input}=    Run Keyword And Return Status    Input    ${50_input_area}    Test
    Should Be Equal    ${50_input}    ${False}
    #Run Keyword And Get Error Then Verify Error to Expected Error Message
    #                                        when error is too long use * > compare to part of the expected message
    ${msg}=    Run Keyword And Expect Error    *    Input    ${50_input_area}    Test
    Should Contain    ${msg}    Element is not currently interactable and may not be manipulated
    #Run Keyword And Expect Error    InvalidElementStateException: Message: invalid element state: Element is not currently interactable and may not be manipulated    ${50_input}
#51
51Pre-render Element 
    Click Element    ${51_1_link}
    SeeEle    ${51_btn}
    Element Should Not Be Visible    ${51_msg}
    Click Element    ${51_btn}
    ${complete_loading}=    Wait Until Element Is Not Visible    ${51_loading}
    Run Keyword If    ${complete_loading}    Element Should Be Visible    ${51_msg}
    Element Should Contain    ${51_msg}    Hello World!
51Post-render Element
    Click Element    ${51_2_link}
    SeeEle    ${51_btn}
    Run Keyword And Expect Error    *    Page Should Contain Element    ${51_msg}
    Click Element    ${51_btn}
    ${complete_loading}=    Wait Until Element Is Not Visible    ${51_loading}    10
    Run Keyword If    ${complete_loading}    Page Should Contain Element    ${51_msg}
    Element Should Contain    ${51_msg}    Hello World!

#52
52 SelectContent
    [Arguments]    ${content}
    ${element}=    Get WebElement    xpath=//a[@href="/shifting-content/${content}"]
    Click Element    ${element}
52 GetAttribute&Check
    [Arguments]    ${tar_att}    ${value}
    ${att}=    Get Element Attribute    ${52_1_box}    style
    #Check if att = value 
    #in this case I check left attribute that have style="value = xx px;"
    Should Be Equal As Strings    ${tar_att}: ${value}px;    ${att}
    RETURN    ${value}
52 GetAttribute
    [Arguments]    ${tar_att}
    ${att}=    Get Element Attribute    ${52_1_box}    style
    RETURN    ${att}
52 SetAttwithLink
    ${old_val}=    52 GetAttribute&Check    left    0
    Click Element    xpath=/html/body/main/div[3]/div/p[3]/a
    ${new_val}=    Wait Until Keyword Succeeds    5s    1s    52 GetAttribute&Check    left    100
    Should Be Equal As Numbers    ${new_val}    100
52 SetAttwithURL
    [Arguments]    ${val}
    ${old_val}=    52 GetAttribute    style
    Go To    https://practice.expandtesting.com/shifting-content/menu?pixel_shift=${val}
    ${new_val}=    52 GetAttribute    style
    Should Not Be Equal    ${old_val}    ${new_val}
52-List Get_List
    @{list}=    Get WebElements    xpath=/html/body/main/div[3]/div/div/div/ol/li
    @{data_list}=    Create List
    FOR    ${elem}    IN    @{list}
        ${txt}=    Get Text    ${elem}
        Append To List    ${data_list}    ${txt}
    END
    RETURN    ${data_list}