*** Settings ***
Documentation  This testing suite will check for the functionality of user login, registration and password reset
Resource  ../Resources/Common.robot
Resource  ../Resources/PO/SignIn.robot
Resource  ../Resources/bnfinApp.robot
Test Setup  Common.Begin Web Test
Test Teardown  Common.End Web Test

# --------------------------------------------------------------------------------------------------
# THIS TEST WILL CHECK FOR THE FUNCTIONALITY OF USER LOGIN, LOGOUT, REGISTRATION AND PASSWORD RESET
# --------------------------------------------------------------------------------------------------

# To run script: robot -d results/logreg tests/logreg.robot

*** Variables ***

*** Test Cases ***

#------------------ All user login tests----------------------------------
Reviewer BBI-1 Login Test
    [Documentation]         Test login as Reviewer BBI-1
    [Tags]                  Reviewer    Login    BBI    TEST
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

#------------------Logout test----------------------------------   

Admin Logout Test
    [Documentation]         Test Logout as Administrator
    [Tags]                  Admin    Logout
    bnfinApp.Login as User Type    ADMIN
    HomeDashboard.Open Top Nav Dropdown
    HomeDashboard.Click Logout Button

#------------------Forgot Password Tests----------------------------------  

User Should Be Able To Reset Password
    [Documentation]         Test Forgot Password
    [Tags]                  Forgot Password
    SignIn.Navigate to "Forgot Password"
    SignIn.Forgot Password    ${VALID_EMAIL}
    Wait Until Page Contains    We've received your request to change your password
    
User Should Not Be Able To Reset Password With Invalid Email
    [Documentation]         Test Forgot Password with invalid email
    [Tags]                  Forgot Password    Ivalid
    SignIn.Navigate to "Forgot Password"
    SignIn.Forgot Password    ${NOT_IN_SYSTEM_EMAIL}
    bnfinApp.User Should See Error Message    Account was not found

User Should Not Be Able To Reset Password With Empty Field
    [Documentation]         Test Forgot Password with empty email field
    [Tags]                  Forgot Password    Ivalid
    SignIn.Navigate to "Forgot Password"
    SignIn.Forgot Password    ${EMPTY_STRING}
    bnfinApp.User Should See Error Message    Please fill Email field

User Should Not Be Able To Reset Password With Invalid Email Format
    [Documentation]         Test Forgot Password with invalid email format field
    [Tags]                  Forgot Password    Ivalid
    SignIn.Navigate to "Forgot Password"
    SignIn.Forgot Password    ${BAD_EMAIL_FORMAT}
    bnfinApp.User Should See Error Message    Invalid {field} format


User Should Be Able To Navigate Back To Login Page From Forgot Password
    [Documentation]         Test Navigation back to login page from Forgot Password
    [Tags]                  Forgot Password    Navigation
    SignIn.Navigate to "Forgot Password"
    SignIn.Click Back To Login Button

#------------------Sign up tests----------------------------------     
