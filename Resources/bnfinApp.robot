*** Settings ***
Resource    ../Resources/PO/SignIn.robot
Resource    ../Resources/PO/HomeDashboard.robot
Resource    ../Resources/PO/PublicPages.robot
*** Variables ***

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

