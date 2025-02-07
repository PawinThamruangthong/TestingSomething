*** Settings ***
Library    AppiumLibrary

*** Variables ***
# emulator
${RemoteURL}           http://localhost:4723/wd/hub
${PlatformName}        Android
${PlatformVersion}     12.0
${DeviceName}          emulator-5554
# application package and activity for open application
${appPackage2}         com.saucelabs.mydemoapp.rn
${appPackage}          com.android.chrome
${appActivity2}        com.saucelabs.mydemoapp.rn.MainActivity
${appActivity}         com.google.android.apps.chrome.Main
# ใช้ adb shell dumpsys window | find "mFocusedApp" ใน cmd เพื่อหาขณะเปิดแอปอยู่ (windows)
# adb shell "dumpsys window windows | grep -E 'mCurrentFocus|mFocusedApp'"

#application locator

##Main Page
${header}            xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]
${open_menu_btn}     xpath=//android.view.ViewGroup[@content-desc="open menu"]
${menu_cata}         xpath=//android.widget.TextView[@text="Catalog"]
${menu_webview}      xpath=//android.widget.TextView[@text="Webview"]
${menu_qr}           xpath=//android.widget.TextView[@text="QR Code Scanner"]
${menu_geo}          xpath=//android.widget.TextView[@text="Geo Location"]
${menu_drawing}      xpath=//android.widget.TextView[@text="Drawing"]
${menu_about}        xpath=//android.view.ViewGroup[@content-desc="menu item about"]
${menu_reset_app_state}    xpath=//android.view.ViewGroup[@content-desc="menu item reset app"]
${menu_biometrics}   xpath=//android.view.ViewGroup[@content-desc="menu item biometrics"]
${menu_login}        xpath=//android.view.ViewGroup[@content-desc="menu item log in"]
${menu_logout}       xpath=//android.view.ViewGroup[@content-desc="menu item log out"]
${menu_api_calls}    xpath=//android.view.ViewGroup[@content-desc="menu item api calls"]
${menu_sauce_bot}    xpath=//android.view.ViewGroup[@content-desc="menu item sauce bot video"]
${menu_cart}         xpath=//android.view.ViewGroup[@content-desc="cart badge"]/android.widget.ImageView
#Catalog
${cat_sort}          xpath=//android.view.ViewGroup[@content-desc="sort button"]/android.widget.ImageView
#Webview
${web_input}         xpath=//android.widget.EditText[@content-desc="URL input field"]

#About
${about_link}        xpath=//android.widget.TextView[@text="Go to the Sauce Labs website."]

#login
${username}          xpath=//android.widget.EditText[@content-desc="Username input field"]
${password}          xpath=//android.widget.EditText[@content-desc="Password input field"]
${login_btn}         xpath=//android.view.ViewGroup[@content-desc="Login button"]

#Scenario
${item1}             xpath=(//android.view.ViewGroup[@content-desc="store item"])[1]/android.view.ViewGroup[1]/android.widget.ImageView
${add_to_cart}       xpath=//android.view.ViewGroup[@content-desc="Add To Cart button"]
#Address
${checkout_btn}      xpath=//android.view.ViewGroup[@content-desc="Proceed To Checkout button"]
${checkout_name}     xpath=//android.widget.EditText[@content-desc="Full Name* input field"]
${checkout_address1}          xpath=//android.widget.EditText[@content-desc="Address Line 1* input field"]
${checkout_address2}          xpath=//android.widget.EditText[@content-desc="Address Line 2 input field"]
${checkout_city}              xpath=//android.widget.EditText[@content-desc="City* input field"]
${checkout_state}             xpath=//android.widget.EditText[@content-desc="State/Region input field"]
${checkout_zip}               xpath=//android.widget.EditText[@content-desc="Zip Code* input field"]
${checkout_country}           xpath=//android.widget.EditText[@content-desc="Country* input field"]
${checkout_to_payment}        xpath=//android.view.ViewGroup[@content-desc="To Payment button"]
#Payment
${payment_name}       xpath=//android.widget.EditText[@content-desc="Full Name* input field"]
${payment_number}     xpath=//android.widget.EditText[@content-desc="Card Number* input field"]
${payment_exp}        xpath=//android.widget.EditText[@content-desc="Expiration Date* input field"]
${payment_cvc}        xpath=//android.widget.EditText[@content-desc="Security Code* input field"]
${payment_sameadd}    xpath=//android.view.ViewGroup[@content-desc="checkbox for My billing address is the same as my shipping address."]/android.view.ViewGroup/android.widget.ImageView
${payment_review}     xpath=//android.view.ViewGroup[@content-desc="Review Order button"]
#Summary
${summary_address}    xpath=//android.view.ViewGroup[@content-desc="checkout delivery address"]
${place_order_btn}    xpath=//android.view.ViewGroup[@content-desc="Place Order button"]