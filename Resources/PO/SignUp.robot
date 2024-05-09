*** Settings ***
Library  SeleniumLibrary
Resource  ../bnfinApp.robot

*** Variables ***
${SIGNUP_NAME_TEXTBOX}=         id=name
${SIGNUP_EMAIL_TEXTBOX}=        id=email
${SIGNUP_PASSWORD_TEXTBOX}=     id=password
${CONFIRM_PASSWORD_TEXTBOX}=    id=confirm-password
${CREATE_ACCOUNT_BUTTON}=       xpath=//*[@id="app"]/div[4]/div/div[2]/form/button

${SIGNUP_NAME_TEXTBOX_ERROR_LOCATOR}=         xpath=//*[@id="app"]/div[4]/div/div[2]/form/div[1]/div/div/div
${SIGNUP_EMAIL_TEXTBOX_ERROR_LOCATOR}=        xpath=//*[@id="app"]/div[4]/div/div[2]/form/div[2]/div/div/div
${SIGNUP_PASSWORD_TEXTBOX_ERROR_LOCATOR}=     xpath=//*[@id="app"]/div[4]/div/div[2]/form/div[3]/div/div/div
${CONFIRM_PASSWORD_TEXTBOX_ERROR_LOCATOR}=    xpath=//*[@id="app"]/div[4]/div/div[2]/form/div[4]/div/div/div
*** Keywords ***

Check If Empty Field Validation Works For Signup Page
    [Arguments]  ${name}  ${email}  ${password}  ${confirm_password}
    Input Text  ${SIGNUP_NAME_TEXTBOX}  ${name}
    Input Text  ${SIGNUP_EMAIL_TEXTBOX}  ${email}
    User Should See Error Message    This field is required
    Input Text  ${SIGNUP_PASSWORD_TEXTBOX}  ${password}
    User Should See Error Message    This field is required
    Input Text  ${CONFIRM_PASSWORD_TEXTBOX}  ${confirm_password}
    User Should See Error Message    Password cannot contain fewer than 12 characters
    Click Element  ${CREATE_ACCOUNT_BUTTON}
    User Should See Error Message    'Password' and 'Confirm Password' must match

Check If Invalid Field Validation Works For Signup Page
    [Arguments]    ${existing_email}  ${password}  ${bad_email} 
    Input Text  ${SIGNUP_EMAIL_TEXTBOX}  ${existing_email}
    Input Text  ${SIGNUP_PASSWORD_TEXTBOX}  ${password}
    User Should See Error Message    Email address already in use
    Input Text  ${SIGNUP_EMAIL_TEXTBOX}  ${bad_email} 
    User Should See Error Message   Password must be at least "Very Strong" 
    Click Element  ${CREATE_ACCOUNT_BUTTON}
    User Should See Error Message    Invalid format

Register With Valid Data
    [Arguments]  ${name}  ${email}  ${password}  ${confirm_password}
    Input Text  ${SIGNUP_NAME_TEXTBOX}  ${name}
    Input Text  ${SIGNUP_EMAIL_TEXTBOX}  ${email}
    Input Text  ${SIGNUP_PASSWORD_TEXTBOX}  ${password}
    Input Text  ${CONFIRM_PASSWORD_TEXTBOX}  ${confirm_password} 
    Click Element  ${CREATE_ACCOUNT_BUTTON}
    Wait Until Page Contains   Your account has been created successfully.