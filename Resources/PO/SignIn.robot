*** Settings ***
Library  SeleniumLibrary


*** Variables ***
${USER_ADMIN}    victoria.administrator
@{USER_LEAD_REVIEWER}    victoria.lead-bbi    victoria.lead-tropicana
@{USER_REVIEWER}    victoria.reviewer-bbi-1    victoria.reviewer-bbi-2     victoria.reviewer-tropicana-1    victoria.reviewer-tropicana-2
@{USER_APPLICANT}    victoria.applicant-1    victoria.applicant-2    victoria.applicant-3
${PASSWORD}    test

*** Keywords ***
Go To Login Page
    Wait Until Element Is Visible    xpath=//a[@href='/login' and contains(@class, 'btn-outline-white')]    10s
    # Scroll Element Into View    xpath=//a[@href='/login' and contains(@class, 'btn-outline-white')]
    # Wait For Condition    return document.readyState == 'complete'
    # Wait Until Element Is Enabled    xpath=//a[@href='/login' and contains(@class, 'btn-outline-white')]
    Click Element    xpath=//a[@href='/login' and contains(@class, 'btn-outline-white')]
    Wait Until Page Contains    Welcome Back

Enter Username
    Input Text    id=username    ${USER_ADMIN}

Enter Password
    Input Text    id=password    ${PASSWORD}