*** Settings ***
Library                    SeleniumLibrary
Library                    String
Resource                   ${CURDIR}/variable.robot


*** Keywords ***

ShouldSeeTxt
    [Arguments]    ${txt}
    Wait Until Page Contains         ${txt}
ShouldSeeEle
    [Arguments]    ${element}
    Wait Until Element Is Visible    ${element}
OpenWebBrowser
    Open Browser     ${url}    ${browser}
    ShouldSeeTxt     QA Playground
HrefCheck
    Click Element    ${github}
    Location Should Be    https://github.com/marko-simic/qa-playground-tests
    Go Back
    Click Element    ${credit}
    ShouldSeeTxt     Linkedin
    Go Back
    Click Element         ${theme}
    Location Should Be    https://github.com/codercatdev/ajonp-fireship-theme

GotoChallenge
    Click Element    ${btn_web_app}
    ShouldSeeTxt     Each mini-app presents a unique test automation challenge

OpenChallenge
    [Arguments]    ${challengenum}
    #Scroll Element Into View    ${challenge_${challengenum}}
    
    Scroll Element Into View    xpath=/html/body/main/div[3]/a[${challengenum}]/div
    #Click Element    ${challenge_${challengenum}}
    Click Element               xpath=/html/body/main/div[3]/a[${challengenum}]/div
    

######### Challenge 2 ###########
InputChallenge2
    [Arguments]    ${1}    ${2}    ${3}    ${4}    ${5}    ${6}
    #input all code in the box
    Input Text    xpath=/html/body/main/div/div/input[1]    ${1}
    Input Text    xpath=/html/body/main/div/div/input[2]    ${2}
    Input Text    xpath=/html/body/main/div/div/input[3]    ${3}
    Input Text    xpath=/html/body/main/div/div/input[4]    ${4}
    Input Text    xpath=/html/body/main/div/div/input[5]    ${5}
    Input Text    xpath=/html/body/main/div/div/input[6]    ${6}
GetAns
    #Get code from page and keep it in array form
    ${txt}     Get Text    ${challenge_ans}
    #remove unneccessary string
    ${txt}=    Remove String    ${txt}    The confirmation code is
    ${txt}=    Remove String    ${txt}    -
    Wait Until Element Is Visible    ${challenge_ans}
    #input code one by one
    InputChallenge2    ${txt}[1]    ${txt}[2]    ${txt}[3]    ${txt}[4]    ${txt}[5]    ${txt}[6]
    
###################################

######### Challenge 3 ###########
VerifyCh3
    ShouldSeeTxt    Tags
    ShouldSeeEle    ${challenge_3_input}
    ShouldSeeEle    ${challenge_3_limit}
    ShouldSeeEle    ${challenge_3_remove}
Ch3Input
    #Input text then press enter
    [Arguments]    @{Array}
    FOR    ${Item}    IN    @{Array}
        Input Text    ${challenge_3_input}    ${item}
        Press Keys    ${challenge_3_input}    RETURN
    END
    
Ch5Drag
    #Jeff    Bill    Warren    Bernard    Carlos    Amancio    LarryE    Mark    Michael    LarryP
    ${txt}=    Get Text    xpath=//"Jeff Bezos"
    log    ${txt}
    #Drag And Drop    ${ch5_Ma}    ${ch5_Bi}
######### Challenge 9 ###########
AttCheck
    #Get Value From Element
    [Arguments]    ${Va}
#                                                        Locator            Attribute    Value
    ${txt}=    Element Attribute Value Should Be    ${challenge_9_guage}    percent    ${Va}


######### Challenge 10 ###########
SelectStar
    [Arguments]    ${rating}
    IF         (${rating}==1)
        Click Element    xpath=/html/body/div/div[1]/div[2]/label[${rating}]
    ELSE IF    (${rating}==2)
        Click Element    xpath=/html/body/div/div[1]/div[2]/label[${rating}]
    ELSE IF    (${rating}==3)
        Click Element    xpath=/html/body/div/div[1]/div[2]/label[${rating}]
    ELSE IF    (${rating}==4)
        Click Element    xpath=/html/body/div/div[1]/div[2]/label[${rating}]
    ELSE IF    (${rating}==5)
        Click Element    xpath=/html/body/div/div[1]/div[2]/label[${rating}]
    END
    ShouldSeeEle    xpath=/html/body/div/div[1]/div[1]/div/li[${rating}]/img

######### Challenge 12 ###########

# UploadFile
#     [Arguments]    ${file_path}
#     Click Element    ${ch12_upload_btn}
#     Choose File    ${ch12_upload_btn}    ${file_path}

######### Challenge 15 ###########
NewEntry
    Click Element    ${ch15_add}
RowCount
    @{elem} =    Get WebElements       xpath://*[@id="app"]/table/tbody[1]/tr[*]
    ${count}=    Get Length    ${elem}
    RETURN       ${count}

######### Challenge 16 ###########
SelectMenu
    [Arguments]          ${menu}
    Open Context Menu    ${ch16_btn}
    ShouldSeeEle         xpath=/html/body/div/div/ul
    Log         ${menu}
    IF         (${menu}==6)
        Click Element             xpath=/html/body/div/div/div/li
        Element Should Contain    ${ch16_btn}    Menu item Settings clicked
    ELSE IF    (${menu}==2)
        Mouse Down           xpath=/html/body/div/div/ul/li[2]
        ShouldSeeEle         xpath=/html/body/div/div/ul/li[2]/ul/li[1]
        Click Element        xpath=/html/body/div/div/ul/li[2]/ul/li[1]
    ELSE
        Click Element        xpath=/html/body/div/div/ul/li[${menu}]
        VerifySelectMenu     ${menu}
    END
VerifySelectMenu
    [Arguments]    ${num}
    IF         ${num==1}
        Element Should Contain    ${ch16_btn}    Menu item Preview clicked
    ELSE IF    ${num==3}
        Element Should Contain    ${ch16_btn}    Menu item Get Link clicked
    ELSE IF    ${num==4}
        Element Should Contain    ${ch16_btn}    Menu item Rename clicked
    ELSE IF    ${num==5}
        Element Should Contain    ${ch16_btn}    Menu item Delete clicked
    END
    
#19
19ElemCount
    [Arguments]    ${num}
    @{elem} =   Get WebElements       xpath://*[@id="nav"]/a
    ${count}=    Get Length    ${elem}
    Click Element    ${elem}[${num}]
    IF    ${num != '0'}
        ${txt}=    Get Text    id=title
        ShouldSeeTxt    ${txt}
    END
#20
20GetText
    ${txt}=    Get Text    ${ch20_location_info}
    Log    ${txt}
#21
21RowCount
    @{elem} =    Get WebElements       xpath://*[@class="icard"]
    ${count}=    Get Length    ${elem}
    RETURN       ${count}
21Text
    [Arguments]    ${element}    ${type}
    @{elem} =   Get WebElements       ${element}
    ${txt}=     Get Text    ${elem}[${type}]
    IF         ${type=='0'}
        Log    Title = ${txt}
    ELSE IF    ${type=='1'}
        Log    Body = ${txt}
    END
21GetSpecifictext
    [Arguments]    ${number}    ${type}
    ${elem}=    Get WebElement    xpath=/html/body/div/div[${number}]
    IF         ${type=='title'}
        21Text    xpath=/html/body/div/div[${number}]/div    0
    ELSE IF    ${type=='body'}
        21Text    xpath=/html/body/div/div[${number}]/div    1
    END
#22
CreateQR
    [Arguments]    ${key}
    Input Text     ${ch22_input}    ${key}
    Click Element  ${ch22_btn}
    ShouldSeeEle   ${ch22_qr}
    ${txt}=        Get Element Attribute  ${ch22_qr}    src
    RETURN         ${txt}    ${key}
OpenGoogleLens
    Go To    https://lens.google.com
LensSearch
    [Arguments]     ${QR}
    ${txt}=         Get WebElement    xpath=//*[@placeholder="วางลิงก์รูปภาพ"]
    ShouldSeeEle    ${txt}
    Input Text      ${txt}    ${QR}
    ${button}=      Get WebElement    xpath=//*[@class="Qwbd3"]
    Click Element   ${button}
    ${qr_result}=   Get Text    xpath=//*[@class="z3rBle Pqkn2e"]
    RETURN          ${qr_result}

#23
23CheckCountdownElement
    [Arguments]     ${time}
    ShouldSeeELe    ${ch23_timer}
    Wait Until Element Contains    ${ch23_timer}    Registration closes in 00:${time} minutes!    10s
    ${txt}=         Get Text    ${ch23_timer}
    RETURN          ${txt}
    #Log    ${txt}
23CountdownComplete
    Wait Until Page Does Not Contain    Registration closes in
    ${txt2}=    Get Text    id=msg
    RETURN    ${txt2}
#24
24GetElementWidth
    ${css}=         Get WebElement    xpath://*[@class="slider"]
    ${prop_val}=    Call Method       ${css}    value_of_css_property    width
    ${percent}=     Strip String   ${prop_val}    characters=px
    RETURN          ${percent}
24Input
    [Arguments]    ${input_percent}
    ##    Make Input(%) in to value that match with element's width
    ${percent}=    24GetElementWidth
    ${n1}=         Convert To Number    ${input_percent}
    ${n2}=         Convert To Number    ${percent}
    ${output}      Evaluate        ${n1}/100*${n2}
    Drag And Drop By Offset    ${ch24_guage}    ${output}    0