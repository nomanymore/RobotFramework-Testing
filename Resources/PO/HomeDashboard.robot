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

${SIDE_NAV_APPLICATIONS_DROPDOWN}=         xpath=//*[@id="app"]/div[4]/div[1]/nav/div/div/div/div[1]/button
${SIDE_NAV_SUBMITTED_LINK}=                xpath=//*[@id="collapse-0"]/div/a[1]
${SIDE_NAV_UNDER_REVIEW_LINK}=             xpath=//*[@id="collapse-0"]/div/a[2]
${SIDE_NAV_SCORED_LINK}=                   xpath=//*[@id="collapse-0"]/div/a[3]


# Applicant
${SIDE_NAV_GRANTS_LINK_APPLICANT}=         xpath=//*[@id="app"]/div[4]/div[1]/nav/div/div/div/div[1]/a[4]  




*** Keywords ***
Navigate To Dash
    go to                       ${DASH_URL}

Navigate To Grants-Applicant
    bnfinapp.Login as User Type    APPLICANT    1
    bnfinApp.Ensure Element Is Clickable And Click    ${SIDE_NAV_GRANTS_LINK_APPLICANT}
    Wait Until Page Contains    Available Grants



Navigate To Submitted Applications
    bnfinapp.Login as User Type    LEAD_REVIEWER    0
    bnfinApp.Ensure Element Is Clickable And Click    ${SIDE_NAV_APPLICATIONS_DROPDOWN}
    bnfinApp.Ensure Element Is Clickable And Click    ${SIDE_NAV_SUBMITTED_LINK}
    Wait Until Page Contains    Submitted Applications


Verify Page Loaded
    Wait Until Element Is Enabled    xpath=//*[@id="app"]/div[4]/div[1]/nav/div    10s

Open Top Nav Dropdown
    bnfinApp.Ensure Element Is Clickable And Click    ${TOP_NAV_DROPDOWN}

Click Logout Button
    bnfinApp.Ensure Element Is Clickable And Click    ${TOP_NAV_LOGOUT}
    Wait Until Page Contains    National Funders    
