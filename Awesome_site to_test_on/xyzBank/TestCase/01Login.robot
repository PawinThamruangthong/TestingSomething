*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/mainPageKeyword.robot
Test Setup    OpenMainPage
*** Test Cases ***

Default
    Page Should Contain    XYZ Bank
HomeBtn
    GoToHome
#customer
Customer - Login
    Login_btn_Customer
    CustomerLogin    1
Customer - Home
    Login_btn_Customer
    CustomerLogin    1
    GoToHome
Customer - Logout
    Login_btn_Customer
    CustomerLogin    1
    Customer_Logout_btn
Manager - Login
    ManagerLogin