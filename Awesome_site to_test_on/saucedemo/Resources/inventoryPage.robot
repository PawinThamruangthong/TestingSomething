*** Settings ***
Library    SeleniumLibrary
Library    Collections
Resource    ../PageObject/variable.robot
Resource    ../Resources/loginPage.robot

*** Keywords ***
NormalUser
    OpenSite
    LoginSuccess    standard_user
    Wait Until Page Contains   Swag Labs
GetAllitem
    #${count}=    Get Element Count    xpath=//*[@class="inventory_item"]
    ${element}=    Get WebElements    xpath=//*[@class="inventory_item"]
    RETURN    ${element}

SelectSubmenu
    [Arguments]    ${sub}
    Click Element    ${btn_submenu}
    Wait Until Element Is Visible    ${submenu_item_list}
    Click Element    ${${sub}}
GetAllitemName
    @{name}=    Create List
    @{item}=    Get WebElements    xpath=//*[@class="inventory_item_name "]
    FOR    ${i}    IN RANGE    6
        ${elem}=    Get Text    ${item}[${i}]
        Append To List    ${name}    ${elem}
    END
    RETURN    @{name}
CheckList
    [Arguments]    ${sort}
    # NameAsc NameDesc PriceAsc PriceDesc
    @{list_name}=    GetAllitemName
    Select From List By Value    ${btn_sort}    ${sort}
    IF    ${sort=='az'}
        @{oldlist}=    Copy List    ${list_name}
        Sort List    ${list_name}
        Lists Should Be Equal    ${list_name}    ${oldlist}
    ELSE IF    ${sort=='za'}
        @{oldlist}=    Copy List    ${list_name}
        Reverse List    ${oldlist}
        @{Newlist}=    GetAllitemName
        Lists Should Be Equal    ${Newlist}    ${oldlist}
    END
