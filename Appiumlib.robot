*** Settings ***
Library           StartDriver.py
Library           AppiumLibrary
Suite Setup      Start WAD
Suite Teardown      Stop WAD
Test Setup       Start AUT
Test Teardown    Stop AUT


*** Variables ***
${REMOTE_URL}           http://localhost:4723
${APP}                  Microsoft.XAMLControlsGallery_8wekyb3d8bbwe!App

*** Test Cases ***
Test Launch application
    wait until element is visible     name=Back
    get element attribute  name=Back  AutomationId=NavigationViewBackButton
    Click element    name=Settings
    wait until element is visible    name=Sound
    SLEEP  5
    Click element    name=Back

*** Keywords ***

Start AUT
    Open Application  ${REMOTE_URL}  platformName=Windows  deviceName=WindowsPC  app=${APP}
    Sleep    5

Stop AUT
    Close Application
    Sleep    5
