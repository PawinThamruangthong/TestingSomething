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
    ...                    appPackage=${appPackage}    
    ...                    appActivity=${appActivity}

OpenApp2
    Open Application       remote_url=${RemoteURL}    
    ...                    platformName=${PlatformName}    
    ...                    playformVersion=${PlatformVersion}    
    ...                    devicename=${DeviceName}
    ...                    automationName=UiAutomator2  
    ...                    appPackage=${appPackage2}
    ...                    appActivity=${appActivity2}
    ...                    NoReset=${True}