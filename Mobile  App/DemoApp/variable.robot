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
${menu_cata}         xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup[2]/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]
${menu_webview}     xpath=//android.widget.TextView[@text="Products"]
${menu_qr}           xpath=//android.widget.TextView[@text="QR Code Scanner"]
${menu_geo}          xpath=//android.widget.TextView[@text="Geo Location"]
${menu_drawing}      xpath=//android.widget.TextView[@text="Drawing"]
${menu_about}        xpath=//android.view.ViewGroup[@content-desc="menu item about"]
${menu_reset_app_state}    xpath=//android.view.ViewGroup[@content-desc="menu item reset app"]
${menu_biometrics}   xpath=//android.view.ViewGroup[@content-desc="menu item biometrics"]
${menu_login}        xpath=//android.view.ViewGroup[@content-desc="menu item log in"]
${menu_logout}       xpath=menu item log out
${menu_api_calls}    xpath=//android.view.ViewGroup[@content-desc="menu item api calls"]
${menu_sauce_bot}    xpath=//android.view.ViewGroup[@content-desc="menu item sauce bot video"]

#Webview
${web_input}         xpath=//android.widget.EditText[@content-desc="URL input field"]