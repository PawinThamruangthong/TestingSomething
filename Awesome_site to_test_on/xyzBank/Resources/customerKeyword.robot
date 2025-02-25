*** Settings ***
Library    SeleniumLibrary
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
TransactionRangeEnd
    [Arguments]    ${time}
    [Documentation]    InputType DDMM HHMM YYYY AM/PM
    Wait Until Element Is Visible    ${cus_transaction_end}
    Input Text    ${cus_transaction_end}    ${time}
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