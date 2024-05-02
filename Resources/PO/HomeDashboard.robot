*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${DASH_URL}=    https://bnfin-staging.curbza.com/home
${HOMEDASH_HEADER_LABEL}=    Home

*** Keywords ***
Navigate To Dash
    go to                       ${DASH_URL}

Verify Page Loaded
    wait until page contains   ${HOMEDASH_HEADER_LABEL}