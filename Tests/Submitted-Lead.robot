*** Settings ***
Documentation  This testing suite will check for the functionality of submitted grant viewing, reviewer assignment and filtering.
Resource  ../Resources/Common.robot
Resource  ../Resources/PO/SignIn.robot
Resource  ../Resources/bnfinApp.robot
Resource  ../Resources/PO/SignUp.robot
Resource  ../Resources/PO/Grants_Lead1.robot
Test Setup  Common.Begin Web Test
Test Teardown  Common.End Web Test

# --------------------------------------------------------------------------------------------------
# THIS TEST WILL CHECK FOR THE FUNCTIONALITY OF THE SUBMITTED GRANTS PAGE FOR THE LEAD REVIEWER COMP.1
# --------------------------------------------------------------------------------------------------

# To run script: robot -d results/submittedLead tests/Submitted-Lead.robot

*** Variables ***

*** Test Cases ***

User Should Be Able To Navigate To The Submitted Grants Page
    [Documentation]  This test will check if the user is able to navigate to the submitted grants page.
    [Tags]  Submitted    Navigation    Run
    HomeDashboard.Navigate To Submitted Applications
