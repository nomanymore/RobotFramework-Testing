*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${BROWSER}         chrome
${USERNAME}        **ADD HERE**
${WEBPASSWORD}        **ADD HERE**
${START_URL}       bnfin-staging.curbza.com/

*** Keywords ***
Begin Web Test
    ${auth_url}=    Catenate    SEPARATOR=    https://${USERNAME}:${WEBPASSWORD}@${START_URL}
    Open Browser    ${auth_url}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    1s

End Web Test
    Close All Browsers
    Log Test Case Status
    
Log Test Case Status
    Run Keyword If    '${TEST STATUS}' != 'PASS'    Log    Test failed: ${TEST NAME}
