*** Settings ***
Library    SeleniumLibrary
Library 	Collections
Library    DateTime
Resource    ../PageObject/variable.robot
Resource    mainPageKeyword.robot
*** Keywords ***

LoginToManagerAccount
    [Documentation]    Log in to Manager Account
    OpenMainPage    
    Login_btn_Manager
    Wait Until Element Is Visible    ${mng_add_cus}
AddCustomer
    [Documentation]    Create Customer Account
    [Arguments]    ${fistName}    ${lastName}    ${postCode}
    Click Element    ${mng_add_cus}
    Wait Until Element Is Visible    ${mng_add_cus_first_name}
    Input Text    ${mng_add_cus_first_name}    ${fistName}
    Input Text    ${mng_add_cus_last_name}    ${lastName}
    Input Text    ${mng_add_cus_post_code}    ${postCode}
    Click Element    ${mng_add_cus_confirm_btn}
    ${msg}=    Handle Alert
    Should Contain    ${msg}    Customer added successfully with customer id :
OpenAccount
    [Documentation]   Open Account for Customer Account
    [Arguments]    ${cus_full_name}    ${acc_currency}
    Click Element    ${mng_open_acc}
    Wait Until Element Is Visible    ${mng_add_acc_currency}
    Select From List By Label    ${mng_add_acc_cus_name}    ${cus_full_name}
    Select From List By Value    ${mng_add_acc_currency}    ${acc_currency}
    Click Element    ${mng_open_acc_process}
    ${msg}=    Handle Alert
    Should Contain    ${msg}    Account created successfully with account Number :
SearchCustomer
    [Documentation]    Search Customer Account By Keyword
    [Arguments]    ${keyword}
    Click Element    ${mng_cus_list}
    Wait Until Element Is Enabled    ${mng_cus_search}
    Input Text    ${mng_cus_search}    ${keyword}
    ${status}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${mng_cus_delete}
    IF    ${status}
        Table Should Contain    ${mng_cus_table}    ${keyword}
    END
DeleteCustomer
    [Documentation]    Search and delete customer
    [Arguments]    ${keyword}
    Click Element    ${mng_cus_list}
    Wait Until Element Is Enabled    ${mng_cus_search}
    Input Text    ${mng_cus_search}    ${keyword}
    ${status}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${mng_cus_delete}
    IF    ${status}
        Table Should Contain    ${mng_cus_table}    ${keyword}
        #${delete_btn}=    Get Table Cell    ${mng_cus_table}    2    5
        ${delete_btn}=    Get WebElement    ${mng_cus_delete}
        Click Element    ${delete_btn}
        Run Keyword And Expect Error    *    Table Should Contain    ${mng_cus_table}    ${keyword}
    END