*** Settings ***
Documentation  This testing suite will check for the functionality of user login, registration and password reset
Resource  ../Resources/Common.robot
Resource  ../Resources/PO/SignIn.robot
Resource  ../Resources/bnfinApp.robot
Test Setup  Common.Begin Web Test
Test Teardown  Common.End Web Test

# To run script: robot -d results tests/logreg.robot

*** Variables ***

*** Test Cases ***

#------------------ All user login tests----------------------------------
Reviewer BBI-1 Login Test
    [Documentation]         Test login as Reviewer BBI-1
    [Tags]                  Reviewer    Login    BBI
    bnfinApp.Login as User Type    REVIEWER    0  

Reviewer BBI-2 Login Test
    [Documentation]         Test login as Reviewer BBI-2
    [Tags]                  Reviewer    Login    BBI
    bnfinApp.Login as User Type    REVIEWER    1  

Reviewer Tropicana-1 Login Test
    [Documentation]         Test login as Reviewer Tropicana-1
    [Tags]                  Reviewer    Login    Tropicana
    bnfinApp.Login as User Type    REVIEWER    2  

Reviewer Tropicana-2 Login Test
    [Documentation]         Test login as Reviewer Tropicana-2
    [Tags]                  Reviewer    Login    Tropicana
    bnfinApp.Login as User Type    REVIEWER    3  

Applicant-1 Login Test
    [Documentation]         Test login as Applicant-1
    [Tags]                  Applicant    Login
    bnfinApp.Login as User Type    APPLICANT    0

Applicant-2 Login Test
    [Documentation]         Test login as Applicant-2
    [Tags]                  Applicant    Login
    bnfinApp.Login as User Type    APPLICANT    1  

Applicant-3 Login Test
    [Documentation]         Test login as Applicant-3
    [Tags]                  Applicant    Login
    bnfinApp.Login as User Type    APPLICANT    2

Lead-Reviewer BBI Login Test
    [Documentation]         Test login as Lead Reviewer BBI
    [Tags]                  Lead-Reviewer    Login    BBI
    bnfinApp.Login as User Type    LEAD_REVIEWER    0

Lead-Reviewer Tropicana Login Test
    [Documentation]         Test login as Lead Reviewer Tropicana
    [Tags]                  Lead-Reviewer    Login    Tropicana
    bnfinApp.Login as User Type    LEAD_REVIEWER    1

Admin Login Test
    [Documentation]         Test login as Administrator
    [Tags]                  Admin    Login
    bnfinApp.Login as User Type    ADMIN

    