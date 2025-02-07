*** Settings ***
Library    AppiumLibrary
Resource    ${CURDIR}/keyword.robot
Task Setup    OpenApp

*** Test Cases ***
  
1 OpenApp
    ${txt}=    Get Text    //android.widget.TextView[@text="Products"]
    Eletxt    //android.widget.TextView[@text="Products"]    Products
#Submenu
    # menu> cata webview qr geo drawing about reset_app_state biometrics login logout api_calls sauce_bot
Submenu - Webview
    OpenSubmenuByTab    webview
    Page Should Contain Text    Webview
    Input Text    ${web_input}    www.automationexercise.com
    Click Element    //android.widget.TextView[@text="Go To Site"]
    Wait Until Page Contains     AutomationExercise
Submenu - Catalog
    OpenSubMenuByTab    webview
    Go Back
Submenu - drawing
    OpenSubMenuByTab    drawing
    Wait Until Element Is Visible    //android.webkit.WebView[@text="Signature Pad demo"]/android.view.View/android.view.View/android.widget.Image[3]
    Swipe    100    500    800    500
    #Element Value Should Be    ${null}
    Click Element    xpath=//android.widget.TextView[@text="Clear"]
Submenu - FromOtherPage
    OpenSubmenuByTab    webview
    OpenSubmenuByTab    cata
Submenu - Geo
    OpenSubmenuByTab    geo
    Wait Until Page Contains    Latitude
Submenu - About
    OpenSubmenuByTab    about
    Wait Until Element Is Visible    ${about_link}
Submenu - reset_app_state
    OpenSubmenuByTab    reset_app_state
    Wait Until Element Is Visible    android:id/button2
    Click Element    android:id/button2
Submenu - Login/Logout
    Login
    Logout
    Wait Until Page Contains    You are successfully logged out.
Submenu - API
    OpenSubmenuByTab    api_calls
    Wait Until Page Contains   API calls
Submenu -SauceBot Video
    OpenSubmenuByTab    sauce_bot
    Wait Until Page Contains    SauceBot - The Beginning

#Cat Page
SortProduct
    #nameAsc    nameDesc    priceAsc    priceDesc
    Cat_Sorting    nameAsc
    Cat_Sorting    nameDesc
    Cat_Sorting    priceAsc
    Cat_Sorting    priceDesc
CartCheck
    CartCheck

#normal process
AddItem
    AddItemtoCart    ${item1}
    CartCheck
CheckOut - not login
    AddItemtoCart    ${item1}
    CartCheck
    ClickBtn    ${checkout_btn}
    Wait Until Page Contains    Login
    InputLoginDataAndLogin
    Wait Until Page Contains    Checkout
CheckOut - Logged In
    Login
    AddItemtoCart    ${item1}
    CartCheck
    ClickBtn    ${checkout_btn}
    Wait Until Page Contains    Checkout
    ShippingData    Rebecca Add    12000NYC    something    NYC    State1    10004    USA
    PaymentData    Rebecca Add    325812657568789    0338    158
    Wait Until Element Is Visible    ${summary_address}
    Click Element    ${place_order_btn}
    Wait Until Page Contains    Thank you