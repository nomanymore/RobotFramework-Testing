*** Settings ***
Documentation  This testing suite will check for the functionality of user login, registration and password reset
Resource  ../Resources/Common.robot
Resource  ../Resources/PO/SignIn.robot
Test Setup  Common.Begin Web Test
Test Teardown  Common.End Web Test

# To run script: robot -d results tests/logreg.robot

*** Variables ***

*** Test Cases ***
Sign In To Website
    SignIn.Go To Login Page
    SignIn.Enter Username
    SignIn.Enter Password
