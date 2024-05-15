*** Settings ***
Documentation  This testing suite will check for the functionality of submitted grant viewing, reviewer assignment and filtering.(Comp default:BBI)
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
#                      THIS SCRIPT WILL USE "BBI" AS THE DEFAULT COMPANY
# --------------------------------------------------------------------------------------------------

# To run script: robot -d results/submittedLead tests/Submitted-Lead.robot

*** Variables ***

*** Test Cases ***

User Should Be Able To Navigate To The Submitted Grants Page
    [Documentation]  This test will check if the user is able to navigate to the submitted grants page.
    [Tags]  Submitted    Navigation    User-Lead
    HomeDashboard.Navigate To Submitted Applications


User Should Be Able To Filter by Intermediary
    [Documentation]  This test will check if the user is able to filter by intermediary
    [Tags]  Grants    Filter     Submitted    User-Lead
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
    [Tags]  Grants    Filter   Submitted    User-Lead
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
    [Tags]  Grants    Filter    Submitted    User-Lead
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
    [Tags]  Grants    Filter     Submitted    User-Lead
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
    [Tags]  Grants    Eligibility    Valid    Submitted    User-Lead
    HomeDashboard.Navigate To Submitted Applications
    Submitted_Lead.View Submitted Application
    Submitted_Lead.Open Eligibility Review Tab
    Submitted_Lead.Fill Eligibility Review Quiz - Mark As Eligible


User Should Be Able To Submit An Eligibility Review Quiz - Decline Application
    [Documentation]  This test will check if the user is able to submit an eligibility review quiz
    [Tags]  Grants    Eligibility    Invalid    Submitted    User-Lead
    HomeDashboard.Navigate To Submitted Applications
    Submitted_Lead.View Submitted Application
    Submitted_Lead.Open Eligibility Review Tab
    Submitted_Lead.Fill Eligibility Review Quiz - Decline

# Declined Application Should Disappear And Only Be Shown Under The "Lead Review - Ineligible" Filter
#     [Documentation]  This test will check if the declined application is filtered out
#     [Tags]  Grants    Filter    Invalid    Run
#     HomeDashboard.Navigate To Submitted Applications
#     Submitted_Lead.View Submitted Application
#     Submitted_Lead.Open Eligibility Review Tab
#     ${app_id}=    Capture Application ID
#     Submitted_Lead.Fill Eligibility Review Quiz - Decline
#     bnfinApp.Ensure Element Is Clickable And Click    ${BACK_TO_SUBMITTED_APPLICATIONS_BUTTON}
#     Submitted_Lead.Open Filter Popup
#     Submitted_Lead.Filter By Tasks/Stage Completion    ${SUB_TASKS_FILTER_LEAD_INELIGIBLE}
#     Element Should Be Visible    xpath=//span[text()='${app_id}']


User Should Not Be Able to Edit An Already Submitted Eligibility Review Quiz
    [Documentation]  This test will pick an application that has already been reviewed and check if the user is able to change the answers
    [Tags]  Grants    Eligibility    Invalid    Submitted    User-Lead
    HomeDashboard.Navigate To Submitted Applications
    Submitted_Lead.View Submitted Application
    Submitted_Lead.Open Eligibility Review Tab
    # Submitted_Lead.Fill Eligibility Review Quiz - Mark As Eligible
    Element Should Be Disabled    ${ELIGIBILITY_QUIZ_SUBMIT_BUTTON}

Assigned Reviewers Have To Be From The Selected Intermediary
    [Documentation]  This test will check if the list of reviewers available for the lead to choose from only contains the selected intermediary
    [Tags]  Grants    Reviewers    Submitted    User-Lead
    HomeDashboard.Navigate To Submitted Applications
    Submitted_Lead.Open Reviewer Assignment Popup
    Element Should Not Contain        ${REVIEWER_ASSIGNMENT_CONTAINER}        Tropicana
    Element Should Not Contain        ${REVIEWER_ASSIGNMENT_CONTAINER}        Groupe 3737
    Element Should Not Contain        ${REVIEWER_ASSIGNMENT_CONTAINER}        Africa Centre

User Should Be Able To Assign A Reviewer
    [Documentation]  This test will check if the user is able to assign a reviewer
    [Tags]  Grants    Reviewers    Submitted    User-Lead
    HomeDashboard.Navigate To Submitted Applications
    Submitted_Lead.Open Reviewer Assignment Popup
    Submitted_Lead.Assign Reviewer Manually   ${REVIEWER_NAME_CHECKBOX1}
    Submitted_Lead.Assign Reviewer Manually   ${REVIEWER_NAME_CHECKBOX2}
    Submitted_Lead.Assign Reviewer Manually   ${REVIEWER_NAME_CHECKBOX3}
    Click Button    ${SUBMIT_REVIEWER_ASSIGNMENT_BUTTON}

User Should Be Able To Search For Applications With Valid Search Term
    [Documentation]  This test will check if the user is able to search for applications using the search bar
    [Tags]  Grants    Search    Submitted    Valid    User-Lead
    HomeDashboard.Navigate To Submitted Applications
    Submitted_Lead.Search For Application    ${SEARCH_GRANT_EXISTING_TERM}

User Should Not Be Able To Search For Applications With Inalid Search Term
    [Documentation]  This test will check if the search returns results when an invalid search term is used
    [Tags]  Grants    Search    Submitted    Invalid    User-Lead
    HomeDashboard.Navigate To Submitted Applications
    ${string6}=    Create String Of Length    6
    Submitted_Lead.Search For Invalid Application    ${string6}