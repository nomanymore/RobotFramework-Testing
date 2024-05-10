*** Settings ***
Documentation  This testing suite will check for the functionality of submitted grant viewing, reviewer assignment and filtering.
Resource  ../Resources/Common.robot
Resource  ../Resources/PO/SignIn.robot
Resource  ../Resources/bnfinApp.robot
Resource  ../Resources/PO/SignUp.robot
Resource  ../Resources/PO/Grants_Lead1.robot
Resource  ../Resources/PO/Submitted_Lead.robot
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
    [Tags]  Submitted    Navigation    
    HomeDashboard.Navigate To Submitted Applications


User Should Be Able To Filter by Intermediary
    [Documentation]  This test will check if the user is able to filter by intermediary
    [Tags]  Grants    Filter     
    HomeDashboard.Navigate To Submitted Applications
    Submitted_Lead.Open Filter Popup
    Submitted_Lead.Filter By Intermediary    bbi
    Submitted_Lead.Clear Filters
    Submitted_Lead.Open Filter Popup
    Submitted_Lead.Filter By Intermediary   tropicana
    Submitted_Lead.Clear Filters
    Submitted_Lead.Open Filter Popup
    Submitted_Lead.Filter By Intermediary   ${SUB_INTERMEDIARY_FILTER_GROUPE3737}
    Submitted_Lead.Clear Filters
    Submitted_Lead.Open Filter Popup
    Submitted_Lead.Filter By Intermediary    ${SUB_INTERMEDIARY_FILTER_AFRICA_CENTRE}


User Should Be Able To Filter by Region
    [Documentation]  This test will check if the user is able to filter by region
    [Tags]  Grants    Filter   
    HomeDashboard.Navigate To Submitted Applications
    Submitted_Lead.Open Filter Popup
    Submitted_Lead.Filter By Region    ${SUB_REGION_FILTER_NS}
    Submitted_Lead.Clear Filters
    Submitted_Lead.Open Filter Popup
    Submitted_Lead.Filter By Region    ${SUB_REGION_FILTER_CENTRAL}
    Submitted_Lead.Clear Filters
    Submitted_Lead.Open Filter Popup
    Submitted_Lead.Filter By Region    ${SUB_REGION_FILTER_PRAIRIE}
    Submitted_Lead.Clear Filters
    Submitted_Lead.Open Filter Popup
    Submitted_Lead.Filter By Region    ${SUB_REGION_FILTER_WEST}
    Submitted_Lead.Clear Filters
    Submitted_Lead.Open Filter Popup
    Submitted_Lead.Filter By Region    ${SUB_REGION_FILTER_NORTH}

User Should Be Able To Filter by Organizational Area Of Focus
    [Documentation]  This test will check if the user is able to filter by organizational area of focus
    [Tags]  Grants    Filter
    HomeDashboard.Navigate To Submitted Applications
    Submitted_Lead.Open Filter Popup
    Submitted_Lead.Filter By Organizational Area Of Focus    ${SUB_FOCUS_FILTER_ENTERPRENEURSHIP}
    Submitted_Lead.Clear Filters
    Submitted_Lead.Open Filter Popup
    Submitted_Lead.Filter By Organizational Area Of Focus    ${SUB_FOCUS_FILTER_ECONOMIC}
    Submitted_Lead.Clear Filters
    Submitted_Lead.Open Filter Popup
    Submitted_Lead.Filter By Organizational Area Of Focus    ${SUB_FOCUS_FILTER_JOB}
    Submitted_Lead.Clear Filters
    Submitted_Lead.Open Filter Popup
    Submitted_Lead.Filter By Organizational Area Of Focus    ${SUB_FOCUS_FILTER_OUTREACH}
    Submitted_Lead.Clear Filters
    Submitted_Lead.Open Filter Popup
    Submitted_Lead.Filter By Organizational Area Of Focus    ${SUB_FOCUS_FILTER_FR_GROUP1}
    Submitted_Lead.Clear Filters
    Submitted_Lead.Open Filter Popup
    Submitted_Lead.Filter By Organizational Area Of Focus    ${SUB_FOCUS_FILTER_EN_GROUP1}
    Submitted_Lead.Clear Filters
    Submitted_Lead.Open Filter Popup
    Submitted_Lead.Filter By Organizational Area Of Focus    ${SUB_FOCUS_FILTER_FR_GROUP2}
    Submitted_Lead.Clear Filters
    Submitted_Lead.Open Filter Popup
    Submitted_Lead.Filter By Organizational Area Of Focus    ${SUB_FOCUS_FILTER_EN_GROUP2}
    Submitted_Lead.Clear Filters
    Submitted_Lead.Open Filter Popup
    Submitted_Lead.Filter By Organizational Area Of Focus    ${SUB_FOCUS_FILTER_FR_GROUP3}
    Submitted_Lead.Clear Filters
    Submitted_Lead.Open Filter Popup
    Submitted_Lead.Filter By Organizational Area Of Focus    ${SUB_FOCUS_FILTER_EN_GROUP3}
    Submitted_Lead.Clear Filters
    Submitted_Lead.Open Filter Popup
    Submitted_Lead.Filter By Organizational Area Of Focus    ${SUB_FOCUS_FILTER_FR_GROUP4}


User Should Be Able To Filter by Tasks/Stage Completion
    [Documentation]  This test will check if the user is able to filter by tasks/stage completion
    [Tags]  Grants    Filter 
    HomeDashboard.Navigate To Submitted Applications
    Submitted_Lead.Open Filter Popup
    Submitted_Lead.Filter By Tasks/Stage Completion    ${SUB_TASKS_FILTER_APP_STAGE}
    Submitted_Lead.Clear Filters
    Submitted_Lead.Open Filter Popup
    Submitted_Lead.Filter By Tasks/Stage Completion    ${SUB_TASKS_FILTER_LEAD_VALIDATION}
    Submitted_Lead.Clear Filters
    Submitted_Lead.Open Filter Popup
    Submitted_Lead.Filter By Tasks/Stage Completion    ${SUB_TASKS_FILTER_LEAD_INELIGIBLE}
    Submitted_Lead.Clear Filters
    Submitted_Lead.Open Filter Popup
    Submitted_Lead.Filter By Tasks/Stage Completion    ${SUB_TASKS_FILTER_REVIEW_COMMITTEE}
    Submitted_Lead.Clear Filters
    Submitted_Lead.Open Filter Popup
    Submitted_Lead.Filter By Tasks/Stage Completion    ${SUB_TASKS_FILTER_LEAD_CONFIRMATION}
    Submitted_Lead.Clear Filters
    Submitted_Lead.Open Filter Popup
    Submitted_Lead.Filter By Tasks/Stage Completion    ${SUB_TASKS_FILTER_APPROVED}
    Submitted_Lead.Clear Filters
    Submitted_Lead.Open Filter Popup
    Submitted_Lead.Filter By Tasks/Stage Completion    ${SUB_TASKS_FILTER_DECLINED}
    Submitted_Lead.Clear Filters
    Submitted_Lead.Open Filter Popup
    Submitted_Lead.Filter By Tasks/Stage Completion    ${SUB_TASKS_FILTER_DEFERRED}
    Submitted_Lead.Clear Filters
    Submitted_Lead.Open Filter Popup
    Submitted_Lead.Filter By Tasks/Stage Completion    ${SUB_TASKS_FILTER_AGREEMENT_STAGE}
    Submitted_Lead.Clear Filters
    Submitted_Lead.Open Filter Popup
    Submitted_Lead.Filter By Tasks/Stage Completion    ${SUB_TASKS_FILTER_RECEIVING_FUNDING}
    Submitted_Lead.Clear Filters
    Submitted_Lead.Open Filter Popup
    Submitted_Lead.Filter By Tasks/Stage Completion    ${SUB_TASKS_FILTER_REPORTS}
    Submitted_Lead.Clear Filters
    Submitted_Lead.Open Filter Popup
    Submitted_Lead.Filter By Tasks/Stage Completion    ${SUB_TASKS_FILTER_COMPLETED}


User Should Be Able To Submit An Eligibility Review Quiz
    [Documentation]  This test will check if the user is able to submit an eligibility review quiz
    [Tags]  Grants    Eligibility    Run
    HomeDashboard.Navigate To Submitted Applications
    Submitted_Lead.View Submitted Application
    Submitted_Lead.Open Eligibility Review Tab
    Submitted_Lead.Fill Eligibility Review Quiz - Mark As Eligible