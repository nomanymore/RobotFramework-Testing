*** Settings ***
Library  SeleniumLibrary
Library    custom_keywords.py
Resource  ../bnfinApp.robot


*** Variables ***

${EXPECTED_RESET_URL}=
${BAD_EMAIL_FORMAT}=   victoria.shmakov
${USER_ADMIN}=    victoria.administrator
@{USER_LEAD_REVIEWER}=    victoria.lead-bbi    victoria.lead-tropicana
@{USER_REVIEWER}=    victoria.reviewer-bbi-1    victoria.reviewer-bbi-2     victoria.reviewer-tropicana-1    victoria.reviewer-tropicana-2
@{USER_APPLICANT}=    victoria.applicant-1    victoria.applicant-2    victoria.applicant-3
${PASSWORD}=    test
${LOGIN_BUTTON}=    xpath=//a[@href='/login' and contains(@class, 'btn-outline-white')]
${LOGIN_BUTTON_LINK}    link=Login
${LOGIN_HEADER_LABEL}=     Welcome Back
${LOGIN_EMAIL_TEXTBOX}=    id=username
${LOGIN_PASSWORD_TEXTBOX}=    id=password
${LOGIN_SUBMIT_BUTTON}=     xpath=//*[@id="app"]/div[4]/div/div[2]/form/button
${SIGNUP_BUTTON}=    link=Sign Up
${BNFIN_BUTTON}=     link=BNFIN
${FORGOT_PASSWORD_LINK}=    link=Forgot Password?
${FORGOT_PASSWORD_EMAIL_TEXTBOX}=    id=email
${FORGOT_PASSWORD_SUBMIT_BUTTON}=    xpath=//*[@id="app"]/div[4]/div/div[2]/form/button

${LOGIN_BUTTON}=    xpath=//a[@href='/login' and contains(@class, 'btn-outline-white')]

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
    bnfinApp.Ensure Element Is Clickable And Click    ${LOGIN_SUBMIT_BUTTON}

Click Sign Up Button
    bnfinApp.Ensure Element Is Clickable And Click    ${SIGNUP_BUTTON}

Click Sign In Button
    bnfinApp.Ensure Element Is Clickable And Click    ${LOGIN_BUTTON_LINK}

Click Forogt-Password Link
    bnfinApp.Ensure Element Is Clickable And Click    ${FORGOT_PASSWORD_LINK}
    Wait Until Page Contains    Forgot Password?

Navigate to "Forgot Password"
    Go To Login Page
    bnfinApp.Ensure Element Is Clickable And Click    ${FORGOT_PASSWORD_LINK}
    Wait Until Page Contains    Forgot Password?

Click "Submit" Button For Forgot Password
    bnfinApp.Ensure Element Is Clickable And Click    ${FORGOT_PASSWORD_SUBMIT_BUTTON}
    
Click Back To Login Button
    Click Sign In Button
    Wait Until Page Contains    ${LOGIN_HEADER_LABEL}

Fill "Forgot Password" Email Field
    [Arguments]    ${Email}
    input text    ${FORGOT_PASSWORD_EMAIL_TEXTBOX}    ${Email}

Forgot Password
    [Arguments]    ${Email} 
    Fill "Forgot Password" Email Field         ${Email}
    Click "Submit" Button For Forgot Password    
    

