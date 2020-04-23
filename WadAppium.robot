*** Settings ***
Library  StartDriver.py
Library  WadAppium.py
Suite Setup         start WAD
Suite Teardown      stop WAD
Test Setup       Start AUT
Test Teardown    Stop AUT

*** Variables ***
${REMOTE_URL}           http://localhost:4723
${APP}                  Microsoft.XAMLControlsGallery_8wekyb3d8bbwe!App
*** Test Cases ***
Testing XAMLControls
    click element by automation id      SettingsNavPaneItem
    Sleep   5
    save screenshot   test123

*** Keywords ***
Start AUT
    start app   ${APP}
    sleep    5

Stop AUT
    close app
    sleep    5

