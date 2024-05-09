*** Settings ***
Library  SeleniumLibrary
Resource  ../bnfinApp.robot


*** Variables ***

${GRANTS_SIDENAV_BUTTON}                      xpath=//*[@id="app"]/div[4]/div[1]/nav/div/div/div/div[1]/a[4]

${CREATE_NEW_GRANT_BUTTON}                    xpath=//*[@id="app"]/div[4]/div[2]/div/div/div[1]/section/main/div/div[2]/a
${BACK_TO_GRANTS_BUTTON}                      xpath=/html/body/div/div[4]/div[2]/div/div/div[1]/section/main/div/a

${GRANTS_SEARCHBOX}                           xpath=//*[@id="app"]/div[4]/div[2]/div/div/div[1]/section/main/div/div[3]/span/input
${NEW_GRANTS_FILTER_BUTTON}                   New Grants
${ACCEPTING_APPLICATIONS_FILTER_BUTTON}       Accepting Applications       
${CLOSED_GRANTS_FILTER_BUTTON}                Closed Grants
${REOPENED_GRANTS_FILTER_BUTTON}              Reopened Grants
${DRAFT_GRANTS_FILTER_BUTTON}                 Draft
${ARCHIVED_GRANTS_FILTER_BUTTON}              Archived
${CLEAR_FILTERS_GRANTS_BUTTON}                xpath=//*[@id="app"]/div[4]/div[2]/div/div/div[1]/section/main/div/div[3]/div[2]/button
${FILTERS_POPUP_BUTTON}                       Filters
${CREATE_GRANT_BUTTON}                        xpath=/html/body/div/div[4]/div[2]/div/div/div[1]/section/main/div/div[2]/button

${ARCHIVE_GRANT_BUTTON}                       xpath=//*[@id="app"]/div[4]/div[2]/div/div/div[1]/section/main/div/div[2]/button       


${DISPLAY_GRANT_NUMBER_SELECT}                xpath=//*[@id="app"]/div[4]/div[2]/div/div/div[1]/section/main/div/div[5]/div/select
${DISPLAY_GRANT_NUMBER_SELECT_6}              6                                          
${DISPLAY_GRANT_NUMBER_SELECT_12}             12
${DISPLAY_GRANT_NUMBER_SELECT_24}             24

${GRANTS_PAGE_LAST}                           xpath=//*[@id="app"]/div[4]/div[2]/div/div/div[1]/section/main/div/div[5]/div[2]/button[2]
${GRANTS_PAGE_FIRST}                          xpath=//*[@id="app"]/div[4]/div[2]/div/div/div[1]/section/main/div/div[5]/div[2]/button[1]
                                                                                
${INDIVIDUAL_GRANT_SAMPLE}                    xpath=//*[@id="app"]/div[4]/div[2]/div/div/div[1]/section/main/div/div[4]/div[1]/a
${YES_ARCHIVE_GRANT_BUTTON}                   xpath=//*[@id="end-of-body"]/div/div/div/div/div[4]/button[2]

${DISPLAYED_GRANT_NAME}                       xpath=//*[@id="app"]/div[4]/div[2]/div/div/div[1]/section/main/div/div[3]/div[1]/div[1]/div
${SEARCH_GRANT_EXISTING_TERM}                 Grant
${CLEAR_SEARCH_TERM_ICON}                     xpath=//*[@id="app"]/div[4]/div[2]/div/div/div[1]/section/main/div/div[3]/span/button[1]

${APPLICATION_TYPE_SELECT}                    xpath=//*[@id="app"]/div[4]/div[2]/div/div/div[1]/section/main/div/div[1]/div/div[1]/div[1]/select
${GRANT_TITLE_TEXTBOX}                        xpath=//*[@id="app"]/div[4]/div[2]/div/div/div[1]/section/main/div/div[1]/div/div[2]/div[1]/input
${BUDGET_TEXTBOX}                             xpath=//*[@id="app"]/div[4]/div[2]/div/div/div[1]/section/main/div/div[1]/div/div[3]/div[1]/input
${MIN_AMOUNT_TEXTBOX}                         xpath=//*[@id="app"]/div[4]/div[2]/div/div/div[1]/section/main/div/div[1]/div/div[4]/div[1]/input
${MAX_AMOUNT_TEXTBOX}                         xpath=//*[@id="app"]/div[4]/div[2]/div/div/div[1]/section/main/div/div[1]/div/div[5]/div[1]/input
${START_DATE_PICKER}                          xpath=//*[@id="app"]/div[4]/div[2]/div/div/div[1]/section/main/div/div[1]/div/div[6]/div[1]/input
${END_DATE_PICKER}                            xpath=//*[@id="app"]/div[4]/div[2]/div/div/div[1]/section/main/div/div[1]/div/div[7]/div[1]/input
${DESCRIPTION_TEXTBOX}                        xpath=//*[@id="app"]/div[4]/div[2]/div/div/div[1]/section/main/div/div[1]/div/div[8]/div[1]/textarea
${INTERMEDIARY_SELECT}                        xpath=//*[@id="app"]/div[4]/div[2]/div/div/div[1]/section/main/div/div[1]/div/div[9]/div[1]/select
${INTERMEDIARY_SELECT_VALUE}                  xpath=//*[@id="app"]/div[4]/div[2]/div/div/div[1]/section/main/div/div[1]/div/div[9]/div[1]/select/option[2]                        
*** Keywords ***

Submit New Grant Button
    Scroll Element Into View    ${CREATE_GRANT_BUTTON}  
    Click Button    ${CREATE_GRANT_BUTTON}  

Set Zoom Level
    [Arguments]    ${zoom_percentage}
    Execute Javascript    document.body.style.zoom='${zoom_percentage}%'

Navigate Back To Grants
    Click Element    ${BACK_TO_GRANTS_BUTTON}

View Individual Grant
    Click Element    ${INDIVIDUAL_GRANT_SAMPLE} 
    Wait Until Element Is Visible    ${ARCHIVE_GRANT_BUTTON} 

Get Grant Name
    ${grant_name}=    Get Text    ${DISPLAYED_GRANT_NAME}
    RETURN    ${grant_name}


Check Grant In Archive
    [Arguments]    ${grant_name}
    Log    Grant name being checked: ${grant_name}
    ${is_in_archive}=    Run Keyword And Return Status    Page Should Contain    ${grant_name}
    Should Be True    ${is_in_archive}    msg=Grant ${grant_name} should be in archive but is not found.

Archive Grant
    ${grant_name}=    Get Grant Name
    Click Element    ${ARCHIVE_GRANT_BUTTON}
    Wait Until Element Is Visible    ${YES_ARCHIVE_GRANT_BUTTON}
    Click Element    ${YES_ARCHIVE_GRANT_BUTTON}
    Filter Archived Grants
    Choose Number Of Grants Per Page    24
    Check Grant In Archive    ${grant_name}


Get Numeric Value
    [Arguments]    ${locator}
    ${value}=    Get Value    ${locator}
    ${numeric_value}=    Convert To Integer    ${value}
    RETURN    ${numeric_value}

Get Length of Field Value
    [Arguments]    ${locator}
    ${value}=    Get Value    ${locator}
    ${length}=    Get Length    ${value}
    RETURN   ${length}

Get Date Value
    [Arguments]    ${locator}
    ${value}=    Get Value    ${locator}
    RETURN   ${value}
# --------------Search Grants------------------------

Search For Grant
    [Arguments]    ${grant_name}
    Input Text    ${GRANTS_SEARCHBOX}    ${grant_name}
    # This will press enter key
    Press Keys    ${GRANTS_SEARCHBOX}    RETURN
    Wait Until Page Contains    ${grant_name}    timeout=10s
    Page Should Not Contain     Loading... 

Search For Invalid Grant
    [Arguments]    ${grant_name}
    Input Text    ${GRANTS_SEARCHBOX}    ${grant_name}
    # This will press enter key
    Press Keys    ${GRANTS_SEARCHBOX}    RETURN
    Page Should Not Contain Element   ${INDIVIDUAL_GRANT_SAMPLE}    timeout=10s
    Page Should Not Contain     Loading... 



# --------------Navigate to Grants-------------------

Navigate To Last Page
    Scroll Element Into View    ${GRANTS_PAGE_LAST} 
    Click Button    ${GRANTS_PAGE_LAST}

Navigate To First Page
    Scroll Element Into View    ${GRANTS_PAGE_FIRST} 
    Click Button    ${GRANTS_PAGE_FIRST}

Navigate To Grants-Lead
    bnfinapp.Login as User Type    LEAD_REVIEWER    0
    Click Element                  ${GRANTS_SIDENAV_BUTTON} 
    Wait Until Page Contains       View current grants and create new grants

Choose Number Of Grants Per Page
    [Arguments]    ${number}
    Scroll Element Into View       ${DISPLAY_GRANT_NUMBER_SELECT}
    Select From List By Value       ${DISPLAY_GRANT_NUMBER_SELECT}    ${number}    


# -------------------Filter Grants-------------------
Filter Archived Grants
    Click Button    ${ARCHIVED_GRANTS_FILTER_BUTTON}
    # Wait Until Page Contains    Archived    timeout=10s

Filter Closed Grants
    Click Button    ${CLOSED_GRANTS_FILTER_BUTTON}
    # Wait Until Page Contains    Closed    timeout=10s

Filter Draft Grants
    Click Button    ${DRAFT_GRANTS_FILTER_BUTTON}
    # Wait Until Page Contains    Draft    timeout=10s

Filter Reopened Grants
    Click Button    ${REOPENED_GRANTS_FILTER_BUTTON}
    # Wait Until Page Contains    Reopened    timeout=10s

Filter Accepting Applications Grants
    Click Button    ${ACCEPTING_APPLICATIONS_FILTER_BUTTON}
    # Wait Until Page Contains    Accepting Applications    timeout=10s

Filter New Grants
    Click Button    ${NEW_GRANTS_FILTER_BUTTON}
    # Wait Until Page Contains    New Grants    timeout=10s

Clear Filters
    Click Button    ${CLEAR_FILTERS_GRANTS_BUTTON}
    Wait Until Page Contains    View current grants and create new grants    timeout=10s

# -------------------Add Grants-------------------

Add New Grant
    Click Element    ${CREATE_NEW_GRANT_BUTTON}
    Wait Until Page Contains    Application Type    timeout=10s

Select Application Type
    [Arguments]  ${app_type}
    Click Element    ${APPLICATION_TYPE_SELECT}
    Select From List By Label    ${APPLICATION_TYPE_SELECT}   ${app_type}

Enter Grant Title
    [Arguments]    ${title}
    Input Text    ${GRANT_TITLE_TEXTBOX}    ${title}

Enter Grant Budget
    [Arguments]    ${budget}
    Input Text    ${BUDGET_TEXTBOX}    ${budget}

Enter Grant Min Amount
    [Arguments]    ${min_amount}
    Input Text    ${MIN_AMOUNT_TEXTBOX}    ${min_amount}

Enter Grant Max Amount
    [Arguments]    ${max_amount}
    Input Text    ${MAX_AMOUNT_TEXTBOX}    ${max_amount}

Enter Grant Start Date
    [Arguments]    ${start_date}
    Input Text    ${START_DATE_PICKER}    ${start_date}

Enter Grant End Date
    [Arguments]    ${end_date}
    Input Text    ${END_DATE_PICKER}    ${end_date}

Enter Grant Description
    [Arguments]    ${description}
    Input Text    ${DESCRIPTION_TEXTBOX}    ${description}

Select Intermediary
    [Arguments]    ${intermediary}
    Scroll Element Into View    ${INTERMEDIARY_SELECT}
    Select From List By Value    ${INTERMEDIARY_SELECT}   ${intermediary}

Field Char Limit Test
    [Arguments]    ${title}    ${title_limit}    ${budget}    ${budget_limit}    ${min_amount}    ${min_amount_limit}    ${max_amount}    ${max_amount_limit}    ${description}    ${description_limit}
    Input Text    ${GRANT_TITLE_TEXTBOX}    ${title}
    ${actual_title_length}=    Get Length of Field Value    ${GRANT_TITLE_TEXTBOX}
    Should Be Equal As Numbers    ${actual_title_length}    ${title_limit}    msg=Title field should be truncated to ${title_limit} characters
    Input Text    ${BUDGET_TEXTBOX}    ${budget}
    ${actual_budget_length}=    Get Length of Field Value    ${BUDGET_TEXTBOX}
    Should Be Equal As Numbers    ${actual_budget_length}    ${budget_limit}    msg=Budget field should be truncated to ${budget_limit} characters
    Input Text    ${MIN_AMOUNT_TEXTBOX}    ${min_amount}
    ${actual_min_amount_length}=    Get Length of Field Value    ${MIN_AMOUNT_TEXTBOX}
    Should Be Equal As Numbers    ${actual_min_amount_length}    ${min_amount_limit}    msg=Min Amount field should be truncated to ${min_amount_limit} characters
    Input Text    ${MAX_AMOUNT_TEXTBOX}    ${max_amount}
    ${actual_max_amount_length}=    Get Length of Field Value    ${MAX_AMOUNT_TEXTBOX}
    Should Be Equal As Numbers    ${actual_max_amount_length}    ${max_amount_limit}    msg=Max Amount field should be truncated to ${max_amount_limit} characters
    Input Text    ${DESCRIPTION_TEXTBOX}    ${description}
    ${actual_description_length}=    Get Length of Field Value    ${DESCRIPTION_TEXTBOX}
    Should Be Equal As Numbers    ${actual_description_length}    ${description_limit}    msg=Description field should be truncated to ${description_limit} characters


Validate Grant Amount Relationships
    [Arguments]    ${min_amount}    ${max_amount}    ${budget}
    Enter Grant Min Amount    ${min_amount}
    Enter Grant Max Amount    ${max_amount}
    Enter Grant Budget    ${budget}

    ${actual_min_amount}=    Get Numeric Value    ${MIN_AMOUNT_TEXTBOX}
    ${actual_max_amount}=    Get Numeric Value    ${MAX_AMOUNT_TEXTBOX}
    ${actual_budget}=    Get Numeric Value    ${BUDGET_TEXTBOX}

    Should Be True    ${actual_min_amount} <= ${actual_max_amount}    msg=Min Amount (${actual_min_amount}) should be less than or equal to Max Amount (${actual_max_amount})
    Should Be True    ${actual_min_amount} <= ${actual_budget}    msg=Min Amount (${actual_min_amount}) should be less than or equal to Budget (${actual_budget})
    Should Be True    ${actual_max_amount} <= ${actual_budget}    msg=Max Amount (${actual_max_amount}) should be less than or equal to Budget (${actual_budget})

Validate Grant Date Relationship
    [Arguments]    ${start_date}    ${end_date}
    Enter Grant Start Date    ${start_date}
    Unselect Frame
    Enter Grant End Date    ${end_date}
    Unselect Frame

    ${actual_start_date}=    Get Date Value    ${START_DATE_PICKER}
    ${actual_end_date}=    Get Date Value    ${END_DATE_PICKER}

    ${is_valid}=    Evaluate    datetime.datetime.strptime("${actual_start_date}", "%Y-%m-%d") < datetime.datetime.strptime("${actual_end_date}", "%Y-%m-%d")    datetime
    Should Be True    ${is_valid}    msg=Start Date (${actual_start_date}) should be before End Date (${actual_end_date})

# -------------------Drafts -----------------------

*** Keywords ***
Edit Draft Grant
    [Arguments]    ${grant_name}
    ${xpath}=    Set Variable    //*[contains(text(), '${grant_name}')]
    Wait Until Element Is Visible    ${xpath}    timeout=10s    error=Grant with name '${grant_name}' not found.
    Click Element    ${xpath}
