*** Settings ***
Resource    ../Resources/PO/SignIn.robot
Resource    ../Resources/PO/HomeDashboard.robot
Resource    ../Resources/PO/PublicPages.robot
*** Variables ***
${EMPTY_STRING}=     ${EMPTY}
${EXPECTED_RESET_URL}=    ${EMPTY}
*** Keywords ***
Login as User Type
    [Arguments]    ${user_type}    ${user_index}=0
    ${email}=    Run Keyword If    '${user_type}'=='ADMIN'    Set Variable    ${USER_ADMIN}
    ...    ELSE IF    '${user_type}'=='LEAD_REVIEWER'    Set Variable    ${USER_LEAD_REVIEWER}[${user_index}]
    ...    ELSE IF    '${user_type}'=='REVIEWER'    Set Variable    ${USER_REVIEWER}[${user_index}]
    ...    ELSE IF    '${user_type}'=='APPLICANT'    Set Variable    ${USER_APPLICANT}[${user_index}]
    ...    ELSE    Set Variable    ${None}
    ${password}=    Set Variable    ${PASSWORD}
    SignIn.Go To Login Page
    SignIn.Login With Valid Credentials    ${email}    ${password}
    Go to "Home" Dashboard

Go to "Home" Dashboard
    HomeDashboard.Navigate To Dash
    HomeDashboard.Verify Page Loaded

Ensure Element Is Clickable And Click
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}    10s
    Wait Until Element Is Enabled    ${locator}    10s
    Click Element    ${locator}

Check If Element Exists
    [Arguments]    ${locator}
    ${exists}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${locator}    5s
    RETURN    ${exists}


Go To "Sign Up" Page From "Sign In" Page
    SignIn.Go To Login Page
    ${button_exists}=    Check If Element Exists    ${SIGNUP_BUTTON}
    Run Keyword If    ${button_exists}    Click Sign Up Button
    ...    ELSE    Fail    "Sign Up button does not exist"
    Verify Page Loaded

Go To "Sign In" Page From "Sign Up" Page
    PublicPages.Navigate To "Sign Up" Page
    ${button_exists}=    Check If Element Exists    ${LOGIN_BUTTON_LINK}
    Run Keyword If    ${button_exists}    Click Sign In Button
    ...    ELSE    Fail    "Sign In button does not exist"
    Verify Page Loaded

Go To "Home Page" From "Sign Up" Page
    PublicPages.Navigate To "Sign Up" Page
    ${button_exists}=    Check If Element Exists    ${BNFIN_BUTTON}
    Run Keyword If    ${button_exists}    Navigate To "Home" Page
    ...    ELSE    Fail    "BNFIN button does not exist"

Page Should Not Have Changed
    [Arguments]    ${expected_url}
    ${current_url}=    Get Location
    Should Be Equal    ${current_url}    ${expected_url}

User Should See Error Message
    [Arguments]    ${error_message}
    Wait Until Page Contains    ${error_message}    timeout=10s
    RETURN    ${TRUE}