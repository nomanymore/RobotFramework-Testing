*** Settings ***
Documentation  This testing suite will check for the functionality of Grant viewing, filtering and archiving for the Lead Reviewer (Comp default:BBI)
Resource  ../Resources/Common.robot
Resource  ../Resources/PO/SignIn.robot
Resource  ../Resources/bnfinApp.robot
Resource  ../Resources/PO/SignUp.robot
Resource  ../Resources/PO/Grants_Lead1.robot
Test Setup  Common.Begin Web Test
Test Teardown  Common.End Web Test

# --------------------------------------------------------------------------------------------------
# THIS TEST WILL CHECK FOR THE FUNCTIONALITY THE GRANTS PAGE FOR THE LEAD REVIEWER COMP.1
#                    THIS SCRIPT WILL USE "BBI" AS THE DEFAULT COMPANY
# --------------------------------------------------------------------------------------------------

# To run script: robot -d results/grantsLead1 tests/Grants-Lead1.robot

*** Variables ***

*** Test Cases ***

User Should Be Able To View The Grants Page
    [Documentation]  This test will check if the user is able to view the grants page
    [Tags]  Grants
    Grants_Lead1.Navigate To Grants-Lead

User Should Be Able To Choose How Many Grants They Want To View Per Page
    [Documentation]  This test will check if the user is able to view the grants page
    [Tags]  Grants    
    Grants_Lead1.Navigate To Grants-Lead
    Grants_Lead1.Choose Number Of Grants Per Page    ${DISPLAY_GRANT_NUMBER_SELECT_6}
    Grants_Lead1.Choose Number Of Grants Per Page    ${DISPLAY_GRANT_NUMBER_SELECT_12}
    Grants_Lead1.Choose Number Of Grants Per Page    ${DISPLAY_GRANT_NUMBER_SELECT_24}

User Should Be Able To Flip Through The Pages Back And Forth
    [Documentation]  This test will check if the pagination on the main grants page is working
    [Tags]  Grants    Navigate
    Grants_Lead1.Navigate To Grants-Lead
    Grants_Lead1.Navigate To Last Page
    Grants_Lead1.Navigate To First Page

User Should Be Able To View Individual Grants
    [Documentation]  This test will check if the user is able to view individual grants
    [Tags]  Grants
    Grants_Lead1.Navigate To Grants-Lead
    Grants_Lead1.View Individual Grant

User Should Be Able To Archive Grants
    [Documentation]  This test will check if the user is able to archive individual grants
    [Tags]  Grants    Archive
    Grants_Lead1.Navigate To Grants-Lead
    # Ensures that the selected grant cannot be a "draft" which doesn't have an archive button
    Grants_Lead1.Filter Closed Grants
    Grants_Lead1.View Individual Grant
    Grants_Lead1.Archive Grant

User Should Be Able To Filter Grants
    [Documentation]  This test will check if the user is able to filter grants
    [Tags]  Grants    Filter    
    Grants_Lead1.Navigate To Grants-Lead
    Grants_Lead1.Filter Archived Grants
    Grants_Lead1.Clear Filters
    Grants_Lead1.Filter Closed Grants
    Grants_Lead1.Clear Filters
    Grants_Lead1.Filter Draft Grants
    Grants_Lead1.Clear Filters
    Grants_Lead1.Filter Reopened Grants
    Grants_Lead1.Clear Filters
    Grants_Lead1.Filter Accepting Applications Grants
    Grants_Lead1.Clear Filters
    Grants_Lead1.Filter New Grants
    Grants_Lead1.Clear Filters
    
User Should Be Able To Search For Grants With Valid Search Term
    [Documentation]  This test will check if the user is able to search for grants using the search bar
    [Tags]  Grants    Search    
    Grants_Lead1.Navigate To Grants-Lead
    Grants_Lead1.Search For Grant    ${SEARCH_GRANT_EXISTING_TERM}

User Should Not Be Able To Search For Grants With Inalid Search Term
    [Documentation]  This test will check if the search returns results when an invalid search term is used
    [Tags]  Grants    Search
    Grants_Lead1.Navigate To Grants-Lead
    ${string6}=    Create String Of Length    6
    Grants_Lead1.Search For Invalid Grant    ${string6}

User Should Be Able To Add A New Grant
    [Documentation]  This test will check if the user is able to add a new grant
    [Tags]  Grants    Add     Valid
    ${string10}=     Create Random String Of Length    10
    ${string100}=    Create Random String Of Length    100
    ${int6}=         Create Random Integer Of Length    6
    ${next_week}=    Get Relative Date    7    %d-%m-%Y
    ${last_week}=    Get Relative Date    -7    %d-%m-%Y
    Grants_Lead1.Navigate To Grants-Lead
    Grants_Lead1.Add New Grant
    # Grants_Lead1.Select Application Type    Capacity Building Form
    Grants_Lead1.Select Application Type    Capital Assistance Form
    Unselect Frame
    Grants_Lead1.Enter Grant Title    ${string10}
    Unselect Frame
    Grants_Lead1.Enter Grant Budget    ${int6} 
    Unselect Frame
    Grants_Lead1.Enter Grant Min Amount    ${int6} 
    Unselect Frame
    Grants_Lead1.Enter Grant Max Amount    ${int6} 
    Unselect Frame
    Grants_Lead1.Enter Grant Start Date    ${last_week}
    Unselect Frame
    Grants_Lead1.Enter Grant End Date      ${next_week}
    Unselect Frame
    Grants_Lead1.Enter Grant Description   ${string100}
    Unselect Frame
    Grants_Lead1.Select Intermediary       bbi
    Unselect Frame
    Grants_Lead1.Submit New Grant Button
    Grants_Lead1.Filter Accepting Applications Grants
    Grants_Lead1.Navigate To Last Page
    Page Should Contain    ${string10}
    # This bottom line will have to be commented out if the Application Type is changed to Capacity Building Form
    Page Should Contain    Capital Assistance Form

User Should Not Be Able To Add A New Grant With Empty Fields
    [Documentation]  This test will make sure the user can't add a new grants when the fields are empty
    [Tags]  Grants    Add     Invalid
    Grants_Lead1.Navigate To Grants-Lead
    Grants_Lead1.Add New Grant
    Grants_Lead1.Submit New Grant Button
    bnfinApp.User Should See Error Message    This field is required

User Should Not Be Able To Insert More Than The Expected Amount Of Characters
    [Documentation]  This test will input more characters than the expected amount and see if the 
    [Tags]  Grants    Add     Invalid
    ${string101}=    Create Random String Of Length    101
    ${string7505}=    Create Random String Of Length    7505
    ${int102}=         Create Random Integer Of Length    102
    Grants_Lead1.Navigate To Grants-Lead
    Grants_Lead1.Add New Grant
    Grants_Lead1.Field Char Limit Test    ${string101}    100     ${int102}    100    ${int102}    100    ${int102}    100    ${string7505}    7500

User Should Not Be Able To Enter Text Values Into Grant Budget
    [Documentation]  This test will check if the user is able to enter text values into numeric fields
    [Tags]  Grants    Add     Invalid    Numeric
    Grants_Lead1.Navigate To Grants-Lead
    Grants_Lead1.Add New Grant
    Grants_Lead1.Enter Grant Budget    ${INVALID_TEXT}
    User Should See Error Message    Error when saving
   
User Should Not Be Able To Enter Text Values Into Min Amount
    [Tags]  Grants    Add     Invalid    Numeric
    Grants_Lead1.Navigate To Grants-Lead
    Grants_Lead1.Add New Grant
    Grants_Lead1.Enter Grant Min Amount    ${INVALID_TEXT}
    User Should See Error Message    Error when saving

User Should Not Be Able To Enter Text Values Into Max Amount
    [Tags]  Grants    Add     Invalid    Numeric
    Grants_Lead1.Navigate To Grants-Lead
    Grants_Lead1.Add New Grant
    Grants_Lead1.Enter Grant Max Amount    ${INVALID_TEXT}
    User Should See Error Message    Error when saving


The Min. Amount Should Be Less Than Or Equal To The Max. Amount, And Both Should Be Less Than Or Equal To The Budget
    [Documentation]  This test will check if the the amount fields are validated correctly
    [Tags]  Grants    Add     Invalid
    Grants_Lead1.Navigate To Grants-Lead
    Grants_Lead1.Add New Grant
    Grants_Lead1.Validate Grant Amount Relationships    7500    5000    7500

The start date should become before the end date
    [Documentation]  This test will check if the the date fields are validated correctly
    [Tags]  Grants    Add     Invalid    
    ${next_week}=    Get Relative Date    7    %d-%m-%Y
    ${last_week}=    Get Relative Date    -7    %d-%m-%Y
    Grants_Lead1.Navigate To Grants-Lead
    Grants_Lead1.Add New Grant
    Grants_Lead1.Validate Grant Date Relationship    ${next_week}    ${last_week}

User Should Be Able To Save Drafts
    [Documentation]  This test will check if the data is retained in the fields when the user navigates away from the page
    [Tags]  Grants    Draft    
    ${string10}=     Create Random String Of Length    10
    ${string100}=    Create Random String Of Length    100
    ${int6}=         Create Random Integer Of Length    6
    ${next_week}=    Get Relative Date    7    %d-%m-%Y
    ${last_week}=    Get Relative Date    -7    %d-%m-%Y
    Grants_Lead1.Navigate To Grants-Lead
    Grants_Lead1.Add New Grant
    Grants_Lead1.Select Application Type    Capacity Building Form
    Unselect Frame
    Grants_Lead1.Enter Grant Title    ${string10}
    Grants_Lead1.Enter Grant Budget    ${int6} 
    Grants_Lead1.Enter Grant Min Amount    ${int6} 
    Grants_Lead1.Enter Grant Max Amount    ${int6} 
    Grants_Lead1.Enter Grant Start Date    ${last_week}
    Unselect Frame
    Grants_Lead1.Enter Grant End Date      ${next_week}
    Unselect Frame
    Grants_Lead1.Enter Grant Description   ${string100}
    Grants_Lead1.Select Intermediary       bbi
    Unselect Frame
    Scroll Element Into View    ${BACK_TO_GRANTS_BUTTON}
    bnfinapp.Ensure Element Is Clickable And Click    ${BACK_TO_GRANTS_BUTTON}
    Grants_Lead1.Filter Draft Grants
    Page Should Contain    ${string10}     

User Should Be Able To Edit Drafts
    [Documentation]  This test will check if the user is able to edit drafts
    [Tags]  Grants    Draft
    ${string10}=     Create Random String Of Length    10
    ${string100}=    Create Random String Of Length    100
    ${int6}=         Create Random Integer Of Length    6
    ${next_week}=    Get Relative Date    7    %d-%m-%Y
    ${last_week}=    Get Relative Date    -7    %d-%m-%Y
    Grants_Lead1.Navigate To Grants-Lead
    Grants_Lead1.Add New Grant
    Grants_Lead1.Select Application Type    Capacity Building Form
    Unselect Frame
    Grants_Lead1.Enter Grant Title    ${string10}
    Grants_Lead1.Enter Grant Start Date    ${last_week}
    Unselect Frame
    Grants_Lead1.Enter Grant End Date      ${next_week}
    Unselect Frame
    Grants_Lead1.Enter Grant Description   ${string100}
    Grants_Lead1.Select Intermediary       bbi
    Unselect Frame
    Scroll Element Into View    ${BACK_TO_GRANTS_BUTTON}
    bnfinapp.Ensure Element Is Clickable And Click    ${BACK_TO_GRANTS_BUTTON}
    Grants_Lead1.Filter Draft Grants
    Grants_Lead1.Edit Draft Grant    ${string10}
    Grants_Lead1.Enter Grant Budget    ${int6} 
    Unselect Frame
    Grants_Lead1.Enter Grant Min Amount    ${int6} 
    Unselect Frame
    Grants_Lead1.Enter Grant Max Amount    ${int6} 
    Unselect Frame
    Grants_Lead1.Select Intermediary       tropicana
    Unselect Frame
    Grants_Lead1.Submit New Grant Button
    
User Should Be Able To Filter by Intermediary
    [Documentation]  This test will check if the user is able to filter by intermediary
    [Tags]  Grants    Filter
    Grants_Lead1.Navigate To Grants-Lead
    Grants_Lead1.Open Filter Popup
    Grants_Lead1.Filter By Intermediary    bbi
    Page Should Contain    BBI
    Grants_Lead1.Clear Filters
    Grants_Lead1.Open Filter Popup
    Grants_Lead1.Filter By Intermediary    tropicana
    Page Should Contain    Tropicana
    Grants_Lead1.Clear Filters
    Grants_Lead1.Open Filter Popup
    Grants_Lead1.Filter By Intermediary    ${INTERMEDIARY_FILTER_GROUPE3737}
    Page Should Contain    Groupe 3737
    Grants_Lead1.Clear Filters
    Grants_Lead1.Open Filter Popup
    Grants_Lead1.Filter By Intermediary    ${INTERMEDIARY_FILTER_AFRICA_CENTRE}
    Page Should Contain    Africa Centre

User Should Be Able To Filter by Status
    [Documentation]  This test will check if the user is able to filter by status
    [Tags]  Grants    Filter
    Grants_Lead1.Navigate To Grants-Lead
    Grants_Lead1.Open Filter Popup
    Grants_Lead1.Filter By Status    ${STATUS_FILTER_DRAFT}
    Page Should Contain    Draft
    Grants_Lead1.Clear Filters
    Grants_Lead1.Open Filter Popup
    Grants_Lead1.Filter By Status    ${STATUS_FILTER_CLOSED}
    Page Should Contain    Closed
    Grants_Lead1.Clear Filters
    Grants_Lead1.Open Filter Popup
    Grants_Lead1.Filter By Status    ${STATUS_FILTER_REOPENED}
    Page Should Contain    Reopened
    Grants_Lead1.Clear Filters
    Grants_Lead1.Open Filter Popup
    Grants_Lead1.Filter By Status    ${STATUS_FILTER_ACCEPTING_APPLICATIONS}
    Page Should Contain    Accepting Applications
    Grants_Lead1.Clear Filters
    Grants_Lead1.Open Filter Popup
    Grants_Lead1.Filter By Status    ${STATUS_FILTER_NEW}
    Page Should Contain    New
    Grants_Lead1.Clear Filters
    Grants_Lead1.Open Filter Popup
    Grants_Lead1.Filter By Status    ${STATUS_FILTER_ARCHIVED}
    Page Should Contain    Archived

User Should Be Able To Filter by Min-Max Amounts
    [Documentation]  This test will check if the user is able to filter by min-max amounts of budget and applicants.
    [Tags]  Grants    Filter
    Grants_Lead1.Navigate To Grants-Lead
    Grants_Lead1.Open Filter Popup
    Grants_Lead1.Filter By Min Budget    0
    Grants_Lead1.Clear Filters
    Grants_Lead1.Open Filter Popup
    Grants_Lead1.Filter By Max Budget    1000
    Grants_Lead1.Clear Filters
    Grants_Lead1.Open Filter Popup
    Grants_Lead1.Flter By Min Applicants    5
    bnfinapp.Check For Field Error    ${ERROR_FIELD}    Failed to retrieve Grants
    Grants_Lead1.Clear Filters
    Grants_Lead1.Open Filter Popup
    Grants_Lead1.Filter By Max Applicants    10
    bnfinapp.Check For Field Error    ${ERROR_FIELD}    Failed to retrieve Grants

User Should Be Able To Filter by Date Ranges
    [Documentation]  This test will check if the user is able to filter by Min-Max start and end dates
    [Tags]  Grants    Filter
    ${tomorrow}=    Get Relative Date    1    %d/%m/%Y
    Grants_Lead1.Navigate To Grants-Lead
    Grants_Lead1.Open Filter Popup
    Grants_Lead1.Filter By Min Start Date    ${tomorrow}
    bnfinapp.Check For Field Error    ${ERROR_FIELD}    Loading...
    Unselect Frame
    Grants_Lead1.Clear Filters
    Grants_Lead1.Open Filter Popup
    Grants_Lead1.Filter By Max Start Date    ${tomorrow}
    bnfinapp.Check For Field Error    ${ERROR_FIELD}    Loading...
    Grants_Lead1.Clear Filters
    Grants_Lead1.Open Filter Popup
    Grants_Lead1.Filter By Min End Date    ${tomorrow}
    bnfinapp.Check For Field Error    ${ERROR_FIELD}    Loading...
    Grants_Lead1.Clear Filters
    Grants_Lead1.Open Filter Popup
    Grants_Lead1.Filter By Max End Date    ${tomorrow}
    bnfinapp.Check For Field Error    ${ERROR_FIELD}    Loading...

# Empty Draft Fields Should Show "-" Instead Of Empty
#     [Documentation]  This test will check if the empty fields in the draft grant are displayed as "-"
#     [Tags]  Grants    Draft    Run
#     Grants_Lead1.Navigate To Grants-Lead
#     Grants_Lead1.Filter Draft Grants
#     Grants_Lead1.View Individual Draft
#     Grants_Lead1.Empty Draft Fields
#     Scroll Element Into View    ${BACK_TO_GRANTS_BUTTON}
#     bnfinapp.Ensure Element Is Clickable And Click    ${BACK_TO_GRANTS_BUTTON}
#     Grants_Lead1.Filter Draft Grants
#     Element Text Should Be    xpath=//*[@id="app"]/div[4]/div[2]/div/div/div[1]/section/main/div/div[4]/div[1]/a/div[1]    -
