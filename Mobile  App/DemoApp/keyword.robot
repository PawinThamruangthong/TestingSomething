*** Settings ***
Library    AppiumLibrary
Resource    ${CURDIR}/variable.robot

*** Keywords ***
OpenApp
    Open Application       remote_url=${RemoteURL}    
    ...                    platformName=${PlatformName}    
    ...                    playformVersion=${PlatformVersion}    
    ...                    devicename=${DeviceName}
    ...                    automationName=UiAutomator2  
    ...                    appPackage=${appPackage2}
    ...                    appActivity=${appActivity2}
    ...                    NoReset=${True}    
    ...                    autoGrantPermissions=${True}
    Element Should Be Visible    ${header}
Eletxt
    [Arguments]    ${ele}    ${txt}
    Element Should Contain Text    ${ele}    ${txt}
#MainPage

#SUBMENU
OpenSubMenu
    [Arguments]    ${menu}
    # menu> cata webview qr geo drawing about reset_app_state biometrics login logout api_calls sauce_bot
    Wait Until Element Is Visible    ${open_menu_btn}
    Click Element    ${open_menu_btn}
    Wait Until Element Is Visible    ${menu_${menu}}
    Click Element    ${menu_${menu}}
OpenSubmenuByTab
    [Arguments]    ${menu}
    @{finger} =    Create List    ${89}    ${152}
    @{positions} =    Create List    ${finger}
    Tap With Positions    ${100}    ${finger}
    Wait Until Element Is Visible    ${menu_${menu}}    5s
    Click Element    ${menu_${menu}}
    Sleep    1s
    
#Login/Logout
Login
    OpenSubmenuByTab    login
    InputLoginDataAndLogin
InputLoginDataAndLogin
    Wait Until Element Is Visible    ${username}
    Input Text    ${username}    bob@example.com
    Input Text    ${password}    10203040
    Click Element    ${login_btn}
Logout
    OpenSubmenuByTab    logout
    Wait Until Element Is Visible    android:id/button1
    Click Element    android:id/button1

#Catalog
Cat_Sorting
    #nameAsc    nameDesc    priceAsc    priceDesc
    [Arguments]    ${menu}
    Wait Until Element Is Visible    ${cat_sort}
    Click Element    ${cat_sort}
    Wait Until Element Is Visible    xpath=//android.view.ViewGroup[@content-desc="priceDesc"]
    ${btn}=    Get Webelement    xpath=//android.view.ViewGroup[@content-desc="${menu}"]
    Wait Until Element Is Visible    ${btn}
    Click Element   ${btn}
CartCheck
    Wait Until Element Is Visible    ${menu_cart}
    Click Element    ${menu_cart}
AddItemtoCart
    [Arguments]    ${item_locator}
    Wait Until Element Is Visible    ${item_locator}
    Click Element    ${item_locator}
    Wait Until Element Is Visible    ${add_to_cart}
    Click Element    ${add_to_cart}
ClickBtn
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}
    Click Element    ${locator}
#CheckOut
ShippingData
    [Arguments]    ${name}    ${ad1}    ${ad2}    ${city}    ${state}    ${zip}    ${country}
    Wait Until Element Is Visible    ${checkout_to_payment}
    Input Text    ${checkout_name}        ${name}
    Input Text    ${checkout_address1}    ${ad1}
    Input Text    ${checkout_address2}    ${ad2}
    Input Text    ${checkout_city}        ${city}
    Input Text    ${checkout_state}       ${state}
    Input Text    ${checkout_zip}         ${zip}
    Input Text    ${checkout_country}     ${country}
    Click Element    ${checkout_to_payment}
PaymentData
    [Arguments]    ${name}    ${card_num}    ${card_exp}    ${card_cvc}
    Wait Until Element Is Visible    ${payment_review}
    Input Text    ${payment_name}    ${name}
    Input Text    ${payment_number}    ${card_num}
    Input Text    ${payment_exp}    ${card_exp}
    Input Text    ${payment_cvc}    ${card_cvc}
    Element Should Be Enabled    ${payment_sameadd}
    Click Element    ${payment_review}