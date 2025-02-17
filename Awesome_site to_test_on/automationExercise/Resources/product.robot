*** Settings ***
Library                    SeleniumLibrary
Library                    String
Resource                   ../PageObjects/variable.robot
Resource                   ${CURDIR}/uniKeyword.robot

*** Keywords ***

SelectSubCatGender
    [Arguments]    ${gender}    ${number}
    ${txt}=    Get WebElement    css=#${gender} > div > ul > li:nth-child(${number}) > a
    Click Element    ${txt}
SelectSubCatBrand
    [Arguments]    ${brand}
    ShouldSeeEle    ${brand_main}
    ${label}=    Get WebElement   xpath=/html/body/section/div/div/div[1]/div/div[2]/div/ul/li[1]/a
    Click Element    ${label}
SelectSubCatBrand2
    [Arguments]    ${brand}
    ShouldSeeEle    ${brand_main}
    ${label}=    Get WebElement   xpath=/html/body/section/div/div[2]/div[1]/div/div[2]/div/ul/li[${brand}]/a
    Click Element    ${label}
    
ViewProduct
    ClickBtn    ${viewproduct_btn}
    Location Should Be    https://www.automationexercise.com/product_details/1
    VerifyMultipleString    Blue Top    Category    Rs. 500    Availability    Condition    Brand
SearchProduct
    [Arguments]    ${keyword}           ${expected_result_keyword}
    Input Text     ${product_search}    ${keyword}
    Click Element  ${product_search_btn}
    Wait Until Page Contains            ${expected_result_keyword}