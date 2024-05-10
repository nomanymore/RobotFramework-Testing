*** Settings ***
Library  SeleniumLibrary
Resource  ../bnfinApp.robot
Resource  ../PO/Grants_Lead1.robot


*** Variables ***

${SUB_FILTERS_POPUP_BUTTON}                       xpath=//*[@id="app"]/div[4]/div[2]/div/div/div[1]/section/main/div/div[2]/button[1]
${SUB_INTERMEDIARY_FILTER_CHECKBOXES}=            xpath=//*[@id="end-of-body"]/div[2]/div/div/div[2]/div/div[1]
${SUB_INTERMEDIARY_FILTER_BBI}=                   BBI
${SUB_INTERMEDIARY_FILTER_TROPICANA}=             Tropicana 
${SUB_INTERMEDIARY_FILTER_GROUPE3737}=            xpath=//*[@id="end-of-body"]/div[2]/div/div/div[2]/div/div[1]/div[3]/label/input
${SUB_INTERMEDIARY_FILTER_AFRICA_CENTRE}=         xpath=//*[@id="end-of-body"]/div[2]/div/div/div[2]/div/div[1]/div[1]/label/input
${SUB_APPLY_FILTER_BUTTON}=                       xpath=//*[@id="end-of-body"]/div[2]/div/div/div[1]/div/button[1]
${SUB_CLEAR_FILTERS_GRANTS_BUTTON}=               xpath=//*[@id="app"]/div[4]/div[2]/div/div/div[1]/section/main/div/div[2]/button[2]

${SUB_REGION_FILTER_CHECKBOXES}=                  xpath=//*[@id="end-of-body"]/div[2]/div/div/div[2]/div/div[2]
${SUB_REGION_FILTER_ATLANTIC}=                    xpath=//*[@id="end-of-body"]/div[2]/div/div/div[2]/div/div[2]/div[1]/label/input
${SUB_REGION_FILTER_PEI}=                         xpath=//*[@id="end-of-body"]/div[2]/div/div/div[2]/div/div[2]/div[1]/div[1]/label/input
${SUB_REGION_FILTER_NFL}=                         xpath=//*[@id="end-of-body"]/div[2]/div/div/div[2]/div/div[2]/div[1]/div[2]/label/input
${SUB_REGION_FILTER_NB}=                          xpath=//*[@id="end-of-body"]/div[2]/div/div/div[2]/div/div[2]/div[1]/div[3]/label/input
${SUB_REGION_FILTER_NS}=                          xpath=//*[@id="end-of-body"]/div[2]/div/div/div[2]/div/div[2]/div[1]/div[4]/label/input
${SUB_REGION_FILTER_CENTRAL}=                     xpath=//*[@id="end-of-body"]/div[2]/div/div/div[2]/div/div[2]/div[2]/label/input
${SUB_REGION_FILTER_ON}=                          xpath=//*[@id="end-of-body"]/div[2]/div/div/div[2]/div/div[2]/div[2]/div[1]/label/input
${SUB_REGION_FILTER_QB}=                          xpath=//*[@id="end-of-body"]/div[2]/div/div/div[2]/div/div[2]/div[2]/div[2]/label/input
${SUB_REGION_FILTER_PRAIRIE}=                     xpath=//*[@id="end-of-body"]/div[2]/div/div/div[2]/div/div[2]/div[3]/label/input
${SUB_REGION_FILTER_AB}=                          xpath=//*[@id="end-of-body"]/div[2]/div/div/div[2]/div/div[2]/div[3]/div[1]/label/input
${SUB_REGION_FILTER_MN}=                          xpath=//*[@id="end-of-body"]/div[2]/div/div/div[2]/div/div[2]/div[3]/div[2]/label/input
${SUB_REGION_FILTER_SK}=                          xpath=//*[@id="end-of-body"]/div[2]/div/div/div[2]/div/div[2]/div[3]/div[3]/label/input
${SUB_REGION_FILTER_WEST}=                        xpath=//*[@id="end-of-body"]/div[2]/div/div/div[2]/div/div[2]/div[4]/label/input
${SUB_REGION_FILTER_BC}=                          xpath=//*[@id="end-of-body"]/div[2]/div/div/div[2]/div/div[2]/div[4]/div/label/input
${SUB_REGION_FILTER_NORTH}=                       xpath=//*[@id="end-of-body"]/div[2]/div/div/div[2]/div/div[2]/div[5]/label/input
${SUB_REGION_FILTER_NT}=                          xpath=//*[@id="end-of-body"]/div[2]/div/div/div[2]/div/div[2]/div[5]/div[1]/label/input
${SUB_REGION_FILTER_NU}=                          xpath=//*[@id="end-of-body"]/div[2]/div/div/div[2]/div/div[2]/div[5]/div[2]/label/input
${SUB_REGION_FILTER_YT}=                          xpath=//*[@id="end-of-body"]/div[2]/div/div/div[2]/div/div[2]/div[5]/div[3]/label/input

${SUB_FOCUS_FILTER_CHECKBOXES}=                   xpath=//*[@id="end-of-body"]/div[2]/div/div/div[2]/div/div[3]/div
${SUB_FOCUS_FILTER_ENTERPRENEURSHIP}=             xpath=//*[@id="end-of-body"]/div[2]/div/div/div[2]/div/div[3]/div[1]/label/input
${SUB_FOCUS_FILTER_ECONOMIC}=                     xpath=//*[@id="end-of-body"]/div[2]/div/div/div[2]/div/div[3]/div[2]/label/input
${SUB_FOCUS_FILTER_JOB}=                          xpath=//*[@id="end-of-body"]/div[2]/div/div/div[2]/div/div[3]/div[3]/label/input
${SUB_FOCUS_FILTER_OUTREACH}=                     xpath=//*[@id="end-of-body"]/div[2]/div/div/div[2]/div/div[3]/div[4]/label/input
${SUB_FOCUS_FILTER_FR_GROUP1}=                    xpath=//*[@id="end-of-body"]/div[2]/div/div/div[2]/div/div[3]/div[5]/label/input
${SUB_FOCUS_FILTER_EN_GROUP1}=                    xpath=//*[@id="end-of-body"]/div[2]/div/div/div[2]/div/div[3]/div[6]/label/input
${SUB_FOCUS_FILTER_FR_GROUP2}=                    xpath=//*[@id="end-of-body"]/div[2]/div/div/div[2]/div/div[3]/div[7]/label/input
${SUB_FOCUS_FILTER_EN_GROUP2}=                    xpath=//*[@id="end-of-body"]/div[2]/div/div/div[2]/div/div[3]/div[8]/label/input
${SUB_FOCUS_FILTER_FR_GROUP3}=                    xpath=//*[@id="end-of-body"]/div[2]/div/div/div[2]/div/div[3]/div[9]/label/input
${SUB_FOCUS_FILTER_EN_GROUP3}=                    xpath=//*[@id="end-of-body"]/div[2]/div/div/div[2]/div/div[3]/div[10]/label/input
${SUB_FOCUS_FILTER_FR_GROUP4}=                    xpath=//*[@id="end-of-body"]/div[2]/div/div/div[2]/div/div[3]/div[11]/label/input

${SUB_TASKS_FILTER_CHECKBOXES}=                   xpath=/html/body/div[1]/div[6]/div[2]/div/div/div[2]/div/div[4]
${SUB_TASKS_FILTER_APP_STAGE}=                    xpath=//*[@id="end-of-body"]/div[2]/div/div/div[2]/div/div[4]/div[1]/label/input
${SUB_TASKS_FILTER_LEAD_VALIDATION}=              xpath=//*[@id="end-of-body"]/div[2]/div/div/div[2]/div/div[4]/div[2]/label/input
${SUB_TASKS_FILTER_LEAD_INELIGIBLE}=              xpath=//*[@id="end-of-body"]/div[2]/div/div/div[2]/div/div[4]/div[3]/label/input
${SUB_TASKS_FILTER_REVIEW_COMMITTEE}=             xpath=//*[@id="end-of-body"]/div[2]/div/div/div[2]/div/div[4]/div[4]/label/input
${SUB_TASKS_FILTER_LEAD_CONFIRMATION}=            xpath=//*[@id="end-of-body"]/div[2]/div/div/div[2]/div/div[4]/div[5]/label/input
${SUB_TASKS_FILTER_APPROVED}=                     xpath=//*[@id="end-of-body"]/div[2]/div/div/div[2]/div/div[4]/div[6]/label/input
${SUB_TASKS_FILTER_DECLINED}=                     xpath=//*[@id="end-of-body"]/div[2]/div/div/div[2]/div/div[4]/div[7]/label/input
${SUB_TASKS_FILTER_DEFERRED}=                     xpath=//*[@id="end-of-body"]/div[2]/div/div/div[2]/div/div[4]/div[8]/label/input
${SUB_TASKS_FILTER_AGREEMENT_STAGE}=              xpath=//*[@id="end-of-body"]/div[2]/div/div/div[2]/div/div[4]/div[9]/label/input
${SUB_TASKS_FILTER_RECEIVING_FUNDING}=            xpath=//*[@id="end-of-body"]/div[2]/div/div/div[2]/div/div[4]/div[10]/label/input
${SUB_TASKS_FILTER_REPORTS}=                      xpath=//*[@id="end-of-body"]/div[2]/div/div/div[2]/div/div[4]/div[11]/label/input
${SUB_TASKS_FILTER_COMPLETED}=                    xpath=//*[@id="end-of-body"]/div[2]/div/div/div[2]/div/div[4]/div[12]/label/input

${ELIGIBILITY_REVIEW_TAB}=                        xpath=//*[@id="review-tab"]
${ELIGIBILITY_REVIEW_QUIZ}=                       xpath=//*[@id="app"]/div[4]/div[2]/div/div/div[1]/section/main/div/div[2]/div[4]/form
${MARK_AS_ELIGIBLE_BUTTON}=                       xpath=//*[@id="app"]/div[4]/div[2]/div/div/div[1]/section/main/div/div[2]/div[4]/form/div/div[9]/div/div[2]/button
${DECLINE_BUTTON}=                                xpath=//*[@id="app"]/div[4]/div[2]/div/div/div[1]/section/main/div/div[2]/div[4]/form/div/div[9]/div/div[1]/button

${ELIGIBILITY_QUIZ_SUBMIT_BUTTON}=                xpath=/html/body/div/div[4]/div[2]/div/div/div[1]/section/main/div/div[2]/div[4]/div/div/button
${SUBMITTED_VIEW_APPLICATION_BUTTON}=             xpath=//a[contains(@href, "/submitted-applications/")]   
*** Keywords ***

Open Filter Popup
    Ensure Element Is Clickable And Click    ${SUB_FILTERS_POPUP_BUTTON}   


Filter By Intermediary
    [Arguments]    ${intermediary}
    Click Element    ${SUB_INTERMEDIARY_FILTER_CHECKBOXES}
    Select Checkbox    ${intermediary}
    Click Button    ${SUB_APPLY_FILTER_BUTTON}


Clear Filters
    Click Button    ${SUB_CLEAR_FILTERS_GRANTS_BUTTON}
    Wait Until Page Contains    Submitted Applications    timeout=10s

Filter By Region
    [Arguments]    ${region}
    # Click Element    ${SUB_REGION_FILTER_CHECKBOXES}
    Select Checkbox    ${region}
    Click Button    ${SUB_APPLY_FILTER_BUTTON}


Filter By Organizational Area Of Focus
    [Arguments]    ${focus}
    # Click Element    ${SUB_FOCUS_FILTER_CHECKBOXES}
    Select Checkbox    ${focus}
    Click Button    ${SUB_APPLY_FILTER_BUTTON}

Filter By Tasks/Stage Completion
    [Arguments]    ${task}
    Select Checkbox    ${task}
    Click Button    ${SUB_APPLY_FILTER_BUTTON}

View Submitted Application
    Click Element    ${SUBMITTED_VIEW_APPLICATION_BUTTON}


Open Eligibility Review Tab
    Click Element    ${ELIGIBILITY_REVIEW_TAB}
    Wait Until Page Contains    Eligibility Review    timeout=10s

Fill Eligibility Review Quiz - Mark As Eligible
    # [Arguments]    ${question}    ${answer}
    Click Element    ${ELIGIBILITY_REVIEW_QUIZ}
    Select Radio Button    legalentity    true
    Select Radio Button    notforprofit    true
    Select Radio Button    blackled    true
    Select Radio Button    leadership    true
    Select Radio Button    governance    true
    Select Radio Button    funding    true
    Select Radio Button    expire    true
    Click Button    ${MARK_AS_ELIGIBLE_BUTTON}
    Click Button    ${ELIGIBILITY_QUIZ_SUBMIT_BUTTON}

Fill Eligibility Review Quiz - Decline
    [Arguments]    ${question}    ${answer}
    Click Element    ${ELIGIBILITY_REVIEW_QUIZ}
    Select Radio Button    legalentity    true
    Select Radio Button    notforprofit    false
    Select Radio Button    blackled    true
    Select Radio Button    leadership    false
    Select Radio Button    governance    false
    Select Radio Button    funding    true
    Select Radio Button    expire    true
    Click Button    ${DECLINE_BUTTON}
    Click Button    ${ELIGIBILITY_QUIZ_SUBMIT_BUTTON}
