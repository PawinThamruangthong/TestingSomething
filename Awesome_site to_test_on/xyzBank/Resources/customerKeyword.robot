*** Settings ***
Library    SeleniumLibrary
Library 	Collections
Library    DateTime
Resource    ../PageObject/variable.robot
Resource    mainPageKeyword.robot
*** Keywords ***

SelectAccount
    [Arguments]    ${num}
    Select From List By Label    ${cus_acc_book}    ${num}
    Wait Until Element Contains    ${selected_book}    ${num}
OpenTransaction
    Wait Until Element Is Visible    ${cus_transaction}
    Click Element    ${cus_transaction}
TransactionRangeStart
    [Arguments]    ${time}
    [Documentation]    InputType DDMM HHMM AM/PM
    Wait Until Element Is Visible    ${cus_transaction_start}
    Input Text    ${cus_transaction_start}    ${time}
    Click Element    xpath=*//body
TransactionRangeEnd
    [Arguments]    ${time}
    [Documentation]    InputType DDMM HHMM YYYY AM/PM
    Wait Until Element Is Visible    ${cus_transaction_end}
    Input Text    ${cus_transaction_end}    ${time}
    Click Element    xpath=*//body
TableCheck
    [Documentation]    Check Table Header
    #Header
    Table Row Should Contain    ${cus_transaction_table}    1    Date-Time
    Table Row Should Contain    ${cus_transaction_table}    1    Amount
    Table Row Should Contain    ${cus_transaction_table}    1    Transaction Type
ShowTable
    TransactionRangeStart    02021200AM
    TransactionRangeEnd    020220151159PM
    Wait Until Element Is Visible    ${cus_transaction_table}
    TableCheck
Deposit
    [Arguments]    ${amount}
    ${old_balance}=    Get Text    ${cus_balance}
    Click Element    ${cus_deposit}
    Wait Until Element Is Visible    ${cus_deposit_amount}
    Input Text    ${cus_deposit_amount}    ${amount}
    Click Button    ${cus_deposit_confirm}
    ${total_balance}=    Evaluate    ${old_balance}+${amount}
    ${new_balance}=    Get Text    ${cus_balance}
    Should Be Equal As Numbers    ${total_balance}    ${new_balance}
DepositMsg
    Wait Until Element Is Visible    ${cus_msg}
    Element Should Contain    ${cus_msg}    Deposit Successful
Withdrawl
    [Arguments]    ${amount}
    ${old_balance}=    Get Text    ${cus_balance}
    Click Element    ${cus_withdrawl}
    Wait Until Element Is Visible    ${cus_withdrawl_amount}
    Input Text    ${cus_withdrawl_amount}    ${amount}
    Click Button    ${cus_withdrawl_confirm}
    ${result}=    Evaluate    ${amount} > ${old_balance}
    IF    ${result}
        WithdrawlMsg    fail
    ELSE
        ${total_balance}=    Evaluate    ${old_balance}-${amount}
        ${new_balance}=    Get Text    ${cus_balance}
        Should Be Equal As Numbers    ${total_balance}    ${new_balance}
        WithdrawlMsg    pass
    END
    
WithdrawlMsg
    [Arguments]    ${msg}
    Wait Until Element Is Visible    ${cus_msg}
    IF    ${msg=='pass'}
        Element Should Contain    ${cus_msg}    Transaction successful
    ELSE IF    ${msg=='fail'}
        Element Should Contain    ${cus_msg}    Transaction Failed. You can not withdraw amount more than the balance.
    END
GetDate
    ${date}=    Get Current Date    result_format=%Y-%m-%dT%H:%M:%S
    
    RETURN    ${date}
SelectStartTodayDate
    Wait Until Element Is Enabled    id=start
    ${date}=    Get Current Date    result_format=%Y-%m-%dT%H:%M:%S    increment=-1 day
    #Input Text    id=start    ${date}
    Click Link    //[@id="start]//a[@title="today"]
SelectEndTodayDate
    Wait Until Element Is Enabled    id=end
    ${date}=    Get Current Date    result_format=%Y-%m-%dT%H:%M:%S    increment=+1 day
    Input Text    id=end    today
    #Click Link    //[@id="start]//a[@data-date="today"]
