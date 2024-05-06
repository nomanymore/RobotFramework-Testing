*** Settings ***
Library  SeleniumLibrary
Resource  ../bnfinApp.robot

*** Variables ***
${DASH_URL}=                 https://bnfin-staging.curbza.com/home
${HOMEDASH_HEADER_LABEL}=    xpath=//*[@id="app"]/div[4]/div[1]/nav/div
${TOP_NAV_DROPDOWN}=         xpath=//*[@id="app"]/div[4]/div[2]/nav/div[1]/div[3]/button
${TOP_NAV_SETTINGS}=         xpath=//*[@id="app"]/div[4]/div[2]/nav/div[1]/div[3]/div/div[2]/a[1]
${TOP_NAV_HELP}=             xpath=//*[@id="app"]/div[4]/div[2]/nav/div[1]/div[3]/div/div[2]/a[2]
${TOP_NAV_LOGOUT}=           xpath=//*[@id="app"]/div[4]/div[2]/nav/div[1]/div[3]/div/div[2]/a[3]
*** Keywords ***
Navigate To Dash
    go to                       ${DASH_URL}

Verify Page Loaded
    Wait Until Element Is Enabled    xpath=//*[@id="app"]/div[4]/div[1]/nav/div    10s

Open Top Nav Dropdown
    bnfinApp.Ensure Element Is Clickable And Click    ${TOP_NAV_DROPDOWN}

Click Logout Button
    bnfinApp.Ensure Element Is Clickable And Click    ${TOP_NAV_LOGOUT}
    Wait Until Page Contains    National Funders    
