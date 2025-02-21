*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/loginPage.robot
Task Setup    OpenSite
#Task Teardown    Close Browser


*** Test Cases ***

LoginUserRequired
    Login    ${EMPTY}    1234
    ErrorMessageCheck    Username is required
LoginPasswordRequired
    Login    standard_user    ${EMPTY}
    ErrorMessageCheck    Password is required
LoginFailWrongUsername
    LoginErrorUsername    Hello
    LoginErrorUsername    User1
    LoginErrorUsername    231564
LoginFailWrongPassword
    LoginErrorPassword    standard_user    32132156
    LoginErrorPassword    locked_out_user    asdasdasd
    LoginErrorPassword    problem_user    ahsdgdasdasdfsd
    LoginErrorPassword    performance_glitch_user    32132156
    LoginErrorPassword    error_user    asdasdasd
    LoginErrorPassword    visual_user    ahsdgdasdasdfsd
