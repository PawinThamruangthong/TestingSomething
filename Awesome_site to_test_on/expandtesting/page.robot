*** Settings ***
Library    SeleniumLibrary
Resource   ${CURDIR}/keyword.robot
Test Setup    OpenWeb
Test Teardown    Close Browser

*** Test Cases ***

Get Sample Title
    SelectApp    80
    SelectApp    60