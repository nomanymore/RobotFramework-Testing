*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${BROWSER}         edge
${USERNAME}        bnfin_demo
${WEBPASSWORD}        ÔúiNÛONä½I
${START_URL}       bnfin-staging.curbza.com/

*** Keywords ***
Begin Web Test
    ${auth_url}=    Catenate    SEPARATOR=    https://${USERNAME}:${WEBPASSWORD}@${START_URL}
    Open Browser    ${auth_url}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    1s

End Web Test
    Close Browser