*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/customerKeyword.robot
Resource    ../Resources/managerKeyword.robot
Suite Setup    LoginToManagerAccount


*** Test Cases ***
Default
    Wait Until Location Is    https://www.globalsqa.com/angularJs-protractor/BankingProject/#/manager
AddCustomer
    AddCustomer    John    Smith    1222
OpenAccount
    OpenAccount    Hermoine Granger    Dollar
CustomerSearchSuccess
    SearchCustomer    Potter
CustomerSearchFail
    SearchCustomer    Jonathan
CustomerDelete
    AddCustomer    John    Smith    1222
    DeleteCustomer    John