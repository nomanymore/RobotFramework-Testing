*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${DASH_URL}=    https://bnfin-staging.curbza.com/home
${HOMEDASH_HEADER_LABEL}=    xpath=//*[@id="app"]/div[4]/div[1]/nav/div

*** Keywords ***
Navigate To Dash
    go to                       ${DASH_URL}

Verify Page Loaded
    Wait Until Element Is Enabled    xpath=//*[@id="app"]/div[4]/div[1]/nav/div    10s