*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    String
Resource    ../PageObject/variable.robot
Resource    ../Resources/loginKeyword.robot
Resource    ../Resources/submenuKeyword.robot

*** Keywords ***
NormalUser
    OpenSite
    LoginSuccess    standard_user
    Wait Until Page Contains   Swag Labs
GetAllitem
    #${count}=    Get Element Count    xpath=//*[@class="inventory_item"]
    ${element}=    Get WebElements    xpath=//*[@class="inventory_item"]
    RETURN    ${element}


GetAllitemName
    @{name}=    Create List
    @{item}=    Get WebElements    xpath=//*[@class="inventory_item_name "]
    FOR    ${i}    IN RANGE    6
        ${elem}=    Get Text    ${item}[${i}]
        Append To List    ${name}    ${elem}
    END
    RETURN    @{name}
GetAllitemPrice
    @{price}=    Create List
    @{item}=    Get WebElements    xpath=//*[@class="inventory_item_price"]
    FOR    ${i}    IN RANGE    6
        ${elem}=    Get Text    ${item}[${i}]
        ${elem}=    Remove String    ${elem}    $    .
        ${elem}=    Convert To Integer    ${elem}
        Append To List    ${price}    ${elem}
    END
    RETURN    @{price}
GetitemBtn
    [Arguments]    ${item}
    Wait Until Page Contains    Swag
    @{add_to_cart}=    Get WebElements    xpath=//*[@class="btn btn_primary btn_small btn_inventory "]
    Click Element    ${add_to_cart}[${item}]
RemoveitemBtn
    [Arguments]    ${item}
    @{remove_from_cart}=    Get WebElements    xpath=//*[@class="btn btn_secondary btn_small btn_inventory "]
    Click Element    ${remove_from_cart}[${item}]
CheckList
    [Arguments]    ${sort}
    # NameAsc NameDesc PriceAsc PriceDesc
    @{list_name}=    GetAllitemName
    @{list_price}=    GetAllitemPrice
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
    # ELSE IF    ${sort=='lohi'}
    #     @{oldlist}=    Copy List    ${list_price}
       
    #     Log List    ${oldlist}
    #     Reverse List    ${oldlist}
    #     Log List    ${oldlist}
    END
