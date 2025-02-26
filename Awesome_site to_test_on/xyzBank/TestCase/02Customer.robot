*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/customerKeyword.robot
Suite Setup    Run Keywords    OpenMainPage    
...    AND    Login_btn_Customer    
...    AND    Run Keyword    CustomerLogin    1
*** Test Cases ***
Cus1 Default
    #Run Keywords    OpenMainPage    Login_btn_Customer
    Wait Until Page Contains   Welcome Hermoine Granger !!
Switch Account
    SelectAccount    1002
    SelectAccount    1003
    SelectAccount    1001
TransactionTableCheck
    SelectAccount    1001
    OpenTransaction
    #DateTime
    TransactionRangeStart    02021200AM
    TransactionRangeEnd    020220151159PM
    Wait Until Element Is Visible    ${cus_transaction_table}
    TableCheck
    Table Column Should Contain    ${cus_transaction_table}    1    Feb 2
    Table Cell Should Contain    ${cus_transaction_table}    2    1    Feb 2
Deposit Pass
    SelectAccount    1001
    Deposit    5000
Withdrawl Pass
    SelectAccount    1001
    Withdrawl    250
Withdrawl Fail
    SelectAccount    1001
    Withdrawl    50000
DepositTransactionCheck
    SelectAccount    1001
    Deposit    10000
    OpenTransaction
    TransactionRangeStart    010120250000AM
    Table Cell Should Contain    //*[@class="table table-bordered table-striped"]    2    2    10000
    Table Cell Should Contain    //*[@class="table table-bordered table-striped"]    2    3    Credit
WithdrawlTransactionCheck
    SelectAccount    1001
    Withdrawl    500
    OpenTransaction
    TransactionRangeStart    010120250000AM
    Table Cell Should Contain    //*[@class="table table-bordered table-striped"]    2    2    500
    Table Cell Should Contain    //*[@class="table table-bordered table-striped"]    2    3    Debit