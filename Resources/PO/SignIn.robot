*** Settings ***
Library  SeleniumLibrary


*** Variables ***
${USER_ADMIN}=    victoria.administrator
@{USER_LEAD_REVIEWER}=    victoria.lead-bbi    victoria.lead-tropicana
@{USER_REVIEWER}=    victoria.reviewer-bbi-1    victoria.reviewer-bbi-2     victoria.reviewer-tropicana-1    victoria.reviewer-tropicana-2
@{USER_APPLICANT}=    victoria.applicant-1    victoria.applicant-2    victoria.applicant-3
${PASSWORD}=    test
${LOGIN_BUTTON}=    xpath=//a[@href='/login' and contains(@class, 'btn-outline-white')]
${LOGIN_HEADER_LABEL}=     Welcome Back
${LOGIN_EMAIL_TEXTBOX}=    id=username
${LOGIN_PASSWORD_TEXTBOX}=    id=password
${LOGIN_SUBMIT_BUTTON}=     xpath=//*[@id="app"]/div[4]/div/div[2]/form/button
*** Keywords ***
Go To Login Page
    Wait Until Element Is Visible    ${LOGIN_BUTTON}     10s
    Click Element    ${LOGIN_BUTTON} 
    Wait Until Page Contains    ${LOGIN_HEADER_LABEL}

Login With Valid Credentials
    [Arguments]    ${Email}     ${Password}
    Fill "Email" Field          ${Email}
    Fill "Password" Field       ${Password}
    Click "Submit" Button

Fill "Email" Field
    [Arguments]    ${Email}
    input text    ${LOGIN_EMAIL_TEXTBOX}    ${Email}

Fill "Password" Field
    [Arguments]    ${Password}
    input text    ${LOGIN_PASSWORD_TEXTBOX}    ${Password}

Click "Submit" Button
    click button    ${LOGIN_SUBMIT_BUTTON}