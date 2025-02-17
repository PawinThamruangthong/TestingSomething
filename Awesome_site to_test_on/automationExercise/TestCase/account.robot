*** Settings ***
Library           SeleniumLibrary
Resource          ../Resources/accountKeyword.robot
Test Setup        OpenWebBrowser
Test Teardown     Close Browser

*** Test Cases ***
SignUp + DeleteAccount
    [Tags]    Login    Register    AccountDelete    Positive
    ClickSignUp
    SignUp    name1    aaa0999548@gmail.com    09416989898    john    smith    apple    aaaaaaaaa    ${null}    India    aaaaaa    aaaaa    120000    0012345648989
    AccountDelete2

LoginFail
    [Tags]    Login    Register    Negative
    ClickSignUp
    Login        aaaa@gmail.com    111111
    VerifyMsg    ${login_error}           Your email or password is incorrect!
    Login        aaa@gmail.com    111111asjdalskdjaslkdj
    VerifyMsg    ${login_error}           Your email or password is incorrect!

RegisterEmailDuplicate
    [Tags]    Register
    ClickSignUp
    Register     aaa@gmail.com     aaaaa
    VerifyMsg    ${register_error_msg}    Email Address already exist!

Register not input email/name field
    [Tags]    Register
    ClickSignUp
    Register     ${None}    aaaaa
    Register     aaagmail.com    ${null}
    Page Should Not Contain    Create Accont