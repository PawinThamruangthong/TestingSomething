*** Settings ***
Library    AppiumLibrary

*** Variables ***
${RemoteURL}           http://localhost:4723/wd/hub
${PlatformName}                 Android
${PlatformVersion}              12.0
${DeviceName}                   emulator-5554
${appPackage2}         com.saucelabs.mydemoapp.rn
${appPackage}          com.android.chrome
${appActivity2}        com.saucelabs.mydemoapp.rn.MainActivity
${appActivity}         com.google.android.apps.chrome.Main
# ใช้ adb shell dumpsys window | find "mFocusedApp" ใน cmd เพื่อหาขณะเปิดแอปอยู่ (windows)
# adb shell "dumpsys window windows | grep -E 'mCurrentFocus|mFocusedApp'"