*** Settings ***
Library    SeleniumLibrary
Resource    ../PageObject/variable.robot
Resource    ../Resources/submenuKeyword.robot
Library    OperatingSystem
*** Keywords ***

hrefCheck
    Wait Until Element Is Visible    ${href_twitter}
    Wait Until Element Is Visible    ${href_facebook}
    Wait Until Element Is Visible    ${href_linkedin}
    hrefTwitter
    hrefFacebook
    hrefLinkedin
hrefTwitter
    Wait Until Location Contains    www.saucedemo.com
    Click Element    ${href_twitter}
    @{browser}=      Get Window Handles
    Switch Window    ${browser}[1]
    Wait Until Location Contains    https://x.com/saucelabs
    Switch Window    ${browser}[0]
hrefFacebook
    Wait Until Location Contains    www.saucedemo.com
    Click Element    ${href_facebook}
    #Wait Until Location Contains    https://www.facebook.com/saucelabs
    @{browser}=      Get Window Handles
    Switch Window    ${browser}[2]
    Wait Until Location Contains    https://www.facebook.com/saucelabs
    Switch Window    ${browser}[0]
hrefLinkedin
    Wait Until Location Contains    www.saucedemo.com
    Click Element    ${href_linkedin}
    @{browser}=      Get Window Handles
    Switch Window    ${browser}[3]
    Wait Until Location Contains    https://www.linkedin.com/company/sauce-labs/
    Switch Window    ${browser}[0]