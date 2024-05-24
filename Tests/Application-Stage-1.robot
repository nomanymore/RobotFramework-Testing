*** Settings ***
Documentation  This testing suite will check the functionality of the "Application Stage 1" part of the process by the applicant.
Resource  ../Resources/Common.robot
Resource  ../Resources/PO/SignIn.robot
Resource  ../Resources/PO/SignUp.robot
Resource  ../Resources/PO/Grants_Lead1.robot
Resource  ../Resources/PO/Submitted_Lead.robot
Resource  ../Resources/PO/App_Stage_1.robot
Test Setup  Common.Begin Web Test
Test Teardown  Common.End Web Test

# -------------------------------------------------------------------------------------------------------------
# THIS TEST WILL CHECK FOR THE FUNCTIONALITY OF THE "APPLICATION STAGE 1" PART OF THE PROCESS BY THE APPLICANT
# -------------------------------------------------------------------------------------------------------------

# To run script: robot -d results/appstage1 tests/Application-Stage-1.robot

*** Variables ***


*** Test Cases ***

User Should Be Able To Navigate To The Grants Page
    [Documentation]  This test will check if the user is able to navigate to the grants page.
    [Tags]  Grants    Navigation    User-Applicant    
    HomeDashboard.Navigate To Grants-Applicant

User Should Be Able To Start A New "Stage-1" Application
    [Documentation]  This test will check if the user is able to start a new "Stage-1" application.
    [Tags]  Grants    User-Applicant    
    HomeDashboard.Navigate To Grants-Applicant
    App_Stage_1.Start "APPLICATION - STAGE 1"

Page 1 - User Should Not Be Able To Continue Application With Empty Fields
    [Documentation]  This test will make sure the user can't continue when the fields are empty
    [Tags]  Grants    Invalid     User-Applicant    
    HomeDashboard.Navigate To Grants-Applicant
    App_Stage_1.Start "APPLICATION - STAGE 1"
    App_Stage_1.Enter Organization Name    ${EMPTY}
    App_Stage_1.Enter Contact Persons First Names    ${EMPTY}    ${EMPTY}    ${EMPTY}
    Unselect Frame
    App_Stage_1.Enter Contact Persons Last Names    ${EMPTY}    ${EMPTY}    ${EMPTY}
    Unselect Frame
    App_Stage_1.Enter Contact Persons Phones        ${EMPTY_LIST}
    Unselect Frame
    App_Stage_1.Enter Contact Persons Emails        ${EMPTY_LIST}
    Unselect Frame
    User Should See Error Message    This field is required
    bnfinApp.Reset All Selects to Default
    # Element Should Be Disabled    ${NEXT_BUTTON}

Page 1 - Test Fields Should Be Valid And Not Contain More Than 100 Chars
    [Documentation]  This test will make sure the text fields contain max 100 chars, the phone number only accepts valid canadian numbers and the email field only accepts valid emails
    [Tags]  Grants    Invalid     User-Applicant        
    ${string101}=    Create Random String Of Length    101
    ${number10}=    Create Random Integer Of Length    10
    HomeDashboard.Navigate To Grants-Applicant
    App_Stage_1.Start "APPLICATION - STAGE 1"
    Wait Until Element Is Visible    ${ORGANIZATION_NAME_INPUT_FIELD}    timeout=10s
    Wait Until Element Is Enabled    ${ORGANIZATION_NAME_INPUT_FIELD}    timeout=10s
    App_Stage_1.Field Char Limit Test    ${ORGANIZATION_NAME_INPUT_FIELD}    ${string101}    100
    App_Stage_1.Field Char Limit Test    ${FIRST_NAME_INPUT_FIELD}    ${string101}    100
    App_Stage_1.Field Char Limit Test    ${LAST_NAME_INPUT_FIELD}    ${string101}    100
    App_Stage_1.Field Char Limit Test    ${PHONE_INPUT_FIELD}    ${number10}    10
    # User Should See Error Message    Please enter a valid Canadian phone number
    
User Should Be Able To Add And Remove Extra Contact Persons
    [Documentation]    User Should Be Able To Add And Remove Extra Contact Persons
    [Tags]  Grants    User-Applicant      
    HomeDashboard.Navigate To Grants-Applicant
    App_Stage_1.Start "APPLICATION - STAGE 1"
    App_Stage_1.Add Extra Field
    App_Stage_1.Remove Extra Field


Page 1 - User Should Be Able To Fill In Fields
    [Documentation]  This test will check if the input fields are working as intended.
    [Tags]  Grants    User-Applicant     test1   
    HomeDashboard.Navigate To Grants-Applicant
    App_Stage_1.Start "APPLICATION - STAGE 1"
    App_Stage_1.Enter Organization Name    Applicant1Organization
    Unselect Frame
    App_Stage_1.Enter Contact Persons First Names    Alice    Bob    Carol
    Unselect Frame
    App_Stage_1.Enter Contact Persons Last Names      Smith    Johnson    Doe
    Unselect Frame
    App_Stage_1.Enter Contact Persons Phones         ${PHONES} 
    Unselect Frame
    App_Stage_1.Enter Contact Persons Emails         ${EMAILS} 


Page 1 - User Should Be Able To Select From List
    [Documentation]  This test will check if the select fields are working as intended, then move onto next page
    [Tags]  Grants    User-Applicant      test1
    HomeDashboard.Navigate To Grants-Applicant
    App_Stage_1.Start "APPLICATION - STAGE 1"
    bnfinApp.Reset All Selects to Default
    App_Stage_1.Enter Contact Persons Civilities    ${CIVILITIES}
    Unselect Frame
    App_Stage_1.Enter Contact Persons Functions     ${FUNCTIONS}
    Click Button    ${NEXT_BUTTON}
    Page Should Contain     General Information


User's "Stage-1" Application Should Be Saved    
    [Documentation]    User Should Be Able To Continue The Same "Stage-1" Application Even If They Leave The Page & Click On Another Application
    [Tags]  Grants    User-Applicant    Draft      
    HomeDashboard.Navigate To Grants-Applicant
    App_Stage_1.Start "APPLICATION - STAGE 1" From Another Grant   



Page 2 - User Should Not Be Able To Continue Application With Empty Fields
    [Documentation]  This test will make sure the user can't continue when the fields are empty
    [Tags]  Grants    Invalid     User-Applicant  
    HomeDashboard.Navigate To Grants-Applicant
    Go To      https://bnfin-staging.curbza.com/eligibility?p=page-2
    App_Stage_1.Enter Legal Name               ${EMPTY}
    App_Stage_1.Enter Phone Number             ${EMPTY}
    App_Stage_1.Enter Email Of Organization    ${EMPTY}
    App_Stage_1.Enter Additional Focus         ${EMPTY}
    User Should See Error Message    This field is required
    bnfinApp.Reset All Selects to Default
    # Element Should Be Disabled    ${NEXT_BUTTON}


Page 2 - Text Fields Should Not Contain More Than Allowed Chars
    [Documentation]  This test will make sure the text fields contain the correct character length
    [Tags]  Grants    Invalid     User-Applicant    
    ${string101}=    Create Random String Of Length    101
    ${string7505}=    Create Random String Of Length    7505
    HomeDashboard.Navigate To Grants-Applicant
    Go To      https://bnfin-staging.curbza.com/eligibility?p=page-2
    App_Stage_1.Field Char Limit Test     ${LEGAL_NAME_TEXTFIELD}    ${string101}    100
    App_Stage_1.Field Char Limit Test    ${ADDITIONAL_FOCUS_TEXTAREA}    ${string7505}    7500


Page 2 - Phone Field Should Only Allow Numeric Values
    [Documentation]  This test will make sure the phone field only accepts numeric values
    [Tags]  Grants    Invalid     User-Applicant    
    HomeDashboard.Navigate To Grants-Applicant
    Go To      https://bnfin-staging.curbza.com/eligibility?p=page-2
    App_Stage_1.Enter Phone Number    8671234abc
    Unselect Frame
    Click Button    ${NEXT_BUTTON}
    User Should See Error Message     Please enter a valid Canadian phone number

Page 2 - Email Field Should Only Accept Valid Email Formats
    [Documentation]  This test will make sure the email field only accepts valid emails
    [Tags]  Grants    Invalid     User-Applicant    
    HomeDashboard.Navigate To Grants-Applicant
    Go To      https://bnfin-staging.curbza.com/eligibility?p=page-2
    App_Stage_1.Enter Email Of Organization    invalidemail.com
    Unselect Frame
    Click Button    ${NEXT_BUTTON}
    User Should See Error Message    Please enter a valid email address 

Page 2 - User Should Be Able To Fill In Fields
    [Documentation]  This test will check if the test fields are working as intended
    [Tags]  Grants    User-Applicant    Valid   
    HomeDashboard.Navigate To Grants-Applicant
    App_Stage_1.Start "APPLICATION - STAGE 1"
    Click Button    ${NEXT_BUTTON}
    App_Stage_1.Enter Legal Name               Applicant1LegalName
    Unselect Frame
    App_Stage_1.Enter Phone Number             8671234567
    Unselect Frame
    App_Stage_1.Enter Email Of Organization    applicant1@example.com
    Unselect Frame
    App_Stage_1.Enter Additional Focus         ${LOREM_IPSUM} 

Page 2 - User Should Be Able To Select From List
    [Documentation]  This test will check if the select fields are working as intended, then move onto next page
    [Tags]  Grants    User-Applicant    Valid   
    HomeDashboard.Navigate To Grants-Applicant
    App_Stage_1.Start "APPLICATION - STAGE 1"
    Click Button    ${NEXT_BUTTON}
    bnfinApp.Reset All Selects to Default
    App_Stage_1.Select Province    YT
    Unselect Frame
    App_Stage_1.Select Organization Type     uninc_non_profit
    Unselect Frame
    App_Stage_1.Select Sub Sector    law
    Unselect Frame
    App_Stage_1.Select Primary Focus    education
    Click Button    ${NEXT_BUTTON}
    Page Should Contain    Leadership Information

Page 3 - User Should Not Be Able To Continue Application With Empty Fields
    [Documentation]  This test will make sure the user can't continue when the fields are empty
    [Tags]  Grants    Invalid     User-Applicant    
    HomeDashboard.Navigate To Grants-Applicant
    Go To      https://bnfin-staging.curbza.com/eligibility?p=page-3
    bnfinApp.Reset All Selects to Default
    Click Button    ${NEXT_BUTTON}
    User Should See Error Message   This field is required
    # Element Should Be Disabled    ${NEXT_BUTTON}

Page 3 - User Should Be Able To Continue With Application With Valid Fields
    [Documentation]  This test will make sure the user can continue when the fields are filled in correctly
    [Tags]  Grants    User-Applicant    Valid    
    HomeDashboard.Navigate To Grants-Applicant
    Go To      https://bnfin-staging.curbza.com/eligibility?p=page-3
    Select Radio Button    black_led               true
    Select Radio Button    black_governance        true
    Select Radio Button    black_leadership        true
    Select From List By Value    ${Q4-SELECT}      english_speaking_other
    Select Radio Button    multi_origin            true
    Select Radio Button    mixed_language          true
    Select Radio Button    female_leadership       true
    Click Button    ${NEXT_BUTTON}
    Page Should Contain    Targeted Population Information

Page 4 - User Should Not Be Able To Continue Application With Empty Fields
    [Documentation]  This test will make sure the user can't continue when the fields are empty
    [Tags]  Grants    User-Applicant    Invalid   
    HomeDashboard.Navigate To Grants-Applicant
    Go To      https://bnfin-staging.curbza.com/eligibility?p=page-4
    bnfinApp.Reset All Selects to Default
    bnfinApp.Clear Checkboxes
    Input Text    ${NUMBER_OF_PEOPLE_INPUT}     ${EMPTY}
    Click Button    ${NEXT_BUTTON}
    User Should See Error Message   This field is required

Page 4 - Numeric Field Should Only Allow Numeric Values
    [Documentation]  This test will make sure the numeric fields only accepts numeric values
    [Tags]  Grants    User-Applicant    Invalid    
    HomeDashboard.Navigate To Grants-Applicant
    Go To      https://bnfin-staging.curbza.com/eligibility?p=page-4
    Input Text    ${NUMBER_OF_PEOPLE_INPUT}     abc
    Click Button    ${NEXT_BUTTON}
    User Should See Error Message    This field is required

Page 4 - "Other" Checkbox Fields Must Have The Adjascent Text Field Filled In
    [Documentation]  This test will make sure the "other" checkbox fields have the adjascent text field filled in
    [Tags]  Grants    User-Applicant    Invalid        
    HomeDashboard.Navigate To Grants-Applicant
    Go To      https://bnfin-staging.curbza.com/eligibility?p=page-4
    bnfinApp.Clear Checkboxes
    Select Checkbox    ${OTHER_CHECKBOX_PAGE4}
    Click Button    ${NEXT_BUTTON}
    User Should See Error Message    Please fill the "Other" Field (or de-select "Other")

Page 4 - User Should Be Able To Continue With Application With Valid Fields
    [Documentation]  This test will make sure the user can continue when the fields are filled in correctly
    [Tags]  Grants    User-Applicant    Valid    
    ${number3}=    Create Random Integer Of Length    3
    HomeDashboard.Navigate To Grants-Applicant
    Go To      https://bnfin-staging.curbza.com/eligibility?p=page-4
    bnfinApp.Reset All Selects to Default
    bnfinApp.Clear Checkboxes
    Select Radio Button    black_serving    true
    Input Text    ${NUMBER_OF_PEOPLE_INPUT}     ${number3}
    Unselect Frame
    Select From List By Value    ${Q3-SELECT}    culture
    Unselect Frame
    Select Checkbox    ${Q4_CHECKBOX_PAGE4}
    Unselect Frame
    Select Checkbox    ${Q5_CHECKBOX_PAGE4}
    Unselect Frame
    Select Checkbox    ${Q6_CHECKBOX_PAGE4}
    Click Button    ${NEXT_BUTTON}
    Page Should Contain    Mailing Address

Page 5 - User Should Not Be Able To Continue Application With Empty Fields
    [Documentation]  This test will make sure the user can't continue when the fields are empty
    [Tags]  Grants    User-Applicant    Invalid    
    HomeDashboard.Navigate To Grants-Applicant
    Go To      https://bnfin-staging.curbza.com/eligibility?p=page-5
    Input Text    ${ADDRESS_TEXTAREA}         ${EMPTY}
    Input Text    ${APT_TEXTFIELD}            ${EMPTY}
    Input Text    ${CITY_TEXTFIELD}           ${EMPTY}
    Input Text    ${POSTCODE_TEXTFIELD}       ${EMPTY}
    Click Button    ${NEXT_BUTTON}
    User Should See Error Message    This field is required

Page 5 - Postal Code Must Be In A Valid Format
    [Documentation]  This test will make sure the postal code field only accepts valid canadian postal codes
    [Tags]  Grants    User-Applicant    Invalid   
    HomeDashboard.Navigate To Grants-Applicant
    Go To      https://bnfin-staging.curbza.com/eligibility?p=page-5
    Input Text      ${POSTCODE_TEXTFIELD}       123456
    Click Button    ${NEXT_BUTTON}
    User Should See Error Message    Invalid postal code entered

Page 5 - Text Fields Should Not Contain More Than Allowed Chars
    [Documentation]  This test will make sure the text fields contain the correct character length
    [Tags]  Grants    Invalid     User-Applicant  
    ${string101}=    Create Random String Of Length    101
    ${string7505}=    Create Random String Of Length    7505
    HomeDashboard.Navigate To Grants-Applicant
    Go To      https://bnfin-staging.curbza.com/eligibility?p=page-5
    App_Stage_1.Field Char Limit Test     ${ADDRESS_TEXTAREA}      ${string101}   100
    App_Stage_1.Field Char Limit Test     ${APT_TEXTFIELD}         ${string101}    100
    App_Stage_1.Field Char Limit Test     ${CITY_TEXTFIELD}        ${string101}    100


Page 5 - User Should Be Able To Continue With Application With Valid Fields
    [Documentation]  This test will make sure the user can continue when the fields are filled in correctly, Optional fields will be left empty
    [Tags]  Grants    User-Applicant    Valid       Run
    HomeDashboard.Navigate To Grants-Applicant
    Go To      https://bnfin-staging.curbza.com/eligibility?p=page-5
    Input Text    ${ADDRESS_TEXTAREA}         1234 Test Street
    Input Text    ${CITY_TEXTFIELD}           Test City
    Input Text    ${APT_TEXTFIELD}            Apt
    Input Text    ${POSTCODE_TEXTFIELD}       A1A1A1
    Click Button    ${NEXT_BUTTON}
    # Page Should Contain    Financial and Size of the Organization Information

Page 6 - User Should Not Be Able To Continue Application With Empty Fields
    [Documentation]  This test will make sure the user can't continue when the fields are empty
    [Tags]  Grants    User-Applicant    Invalid        
    HomeDashboard.Navigate To Grants-Applicant
    Go To      https://bnfin-staging.curbza.com/eligibility?p=page-6
    App_Stage_1.Enter Financial Information    ${EMPTY}    ${EMPTY}    ${EMPTY}     ${EMPTY}    ${EMPTY}    ${EMPTY}
    Unselect Frame
    App_Stage_1.Enter Employee Information    ${EMPTY}    ${EMPTY}    ${EMPTY}    ${EMPTY}    ${EMPTY}    ${EMPTY}    ${EMPTY}    ${EMPTY}    ${EMPTY}
    Unselect Frame
    App_Stage_1.Enter Social URLs    ${EMPTY}    ${EMPTY}    ${EMPTY}    ${EMPTY}    ${EMPTY}
    Click Button    ${NEXT_BUTTON}
    User Should See Error Message    This field is required

Page 6 - Numeric Field Should Only Allow Numeric Values
    [Documentation]  This test will make sure the numeric fields only accepts numeric values/dates
    [Tags]  Grants    User-Applicant    Invalid     
    HomeDashboard.Navigate To Grants-Applicant
    Go To      https://bnfin-staging.curbza.com/eligibility?p=page-6
    App_Stage_1.Enter Employee Information    abc    abc    abc    abc    abc    abc    abc    abc   abc
    App_Stage_1.Enter Financial Information    abc    abc    abc     abc    abc    abc
    Click Button    ${NEXT_BUTTON}
    User Should See Error Message    This field is required
    

Page 6 - Social URL Fields Should Only Allow Valid URLs For The Specific Social Media Platforms
    [Documentation]  This test will make sure the social URL fields only accepts valid URLs
    [Tags]  Grants    User-Applicant    Invalid     
    HomeDashboard.Navigate To Grants-Applicant
    Go To      https://bnfin-staging.curbza.com/eligibility?p=page-6
    App_Stage_1.Enter Social URLs    invalidurl    invalidurl.com    invalidurl.com    invalidurl.com    invalidurl.com
    Click Button    ${NEXT_BUTTON}
    User Should See Error Message    Please enter a proper url

Page 6 - User Should Be Able To Add And Remove Extra Financial Information Fields
    [Documentation]    This test will check the functionality of the "Add Extra Field" and "Remove Extra Field" buttons
    [Tags]  Grants    User-Applicant    
    HomeDashboard.Navigate To Grants-Applicant
    Go To      https://bnfin-staging.curbza.com/eligibility?p=page-6
    Click Button    ${PLUS_BUTTON_PAGE6}
    Click Button    ${MINUS_BUTTON_PAGE6}

Page 6 - User Should Be Able To Continue With Application With Valid Fields
    [Documentation]  This test will make sure the user can continue when the fields are filled in correctly, Optional fields will be left empty
    [Tags]  Grants    User-Applicant    Valid    Run
    HomeDashboard.Navigate To Grants-Applicant
    Go To      https://bnfin-staging.curbza.com/eligibility?p=page-5
    Click Button    ${NEXT_BUTTON}
    Wait Until Element Is Visible    ${DATE_OF_INCORP}    timeout=10s
    ${today}=    Get Current Date     %d-%m-%Y
    ${a_while_ago}=    Get Relative Date    -22    %d-%m-%Y
    ${int5}=    Create Random Integer Of Length    5
    ${int6}=    Create Random Integer Of Length    6
    ${int3a}=    Create Random Integer Of Length    3
    ${int3}=    Create Random Integer Of Length    3
    ${int2}=    Create Random Integer Of Length    2
    ${int1}=    Create Random Integer Of Length    1
    App_Stage_1.Enter Date Of Incorporation    ${a_while_ago}
    App_Stage_1.Enter Date Of Last Financial Statement    ${today}
    Unselect Frame
    App_Stage_1.Enter Financial Information    ${int3}    ${int3}    ${int3a}     ${int6}    ${int5}    ${int5}
    Unselect Frame
    App_Stage_1.Enter Employee Information    ${int2}    ${int2}    ${int1}    ${int2}    ${int2}    ${int2}    ${int1}    ${int1}    ${int1}
    Unselect Frame
    App_Stage_1.Enter Social URLs    ${EMPTY}    ${EMPTY}    ${EMPTY}    ${EMPTY}    ${EMPTY}
    Unselect Frame
    Click Button    ${NEXT_BUTTON}


