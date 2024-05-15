*** Settings ***
Resource    ../Resources/PO/SignIn.robot



*** Variables ***

${APPLICATION_STAGE1_LINK}=     xpath=(//a[contains(@href, "/eligibility")])[1] 
${BEGIN_APPLICATION_BUTTON}=    xpath=//button[contains(text(), "Begin")]
${NEXT_BUTTON}=                 xpath=//button[contains(text(), "Next")]
${BACK_BUTTON}=                 xpath=//button[contains(text(), "Back")]
${PLUS_BUTTON}=                 xpath=//*[@id="app"]/div[4]/div[2]/div/div/div[1]/section/main/div/div[2]/div[2]/div/div[1]/button[1]
${MINUS_BUTTON}=                xpath=//*[@id="app"]/div[4]/div[2]/div/div/div[1]/section/main/div/div[2]/div[2]/div/div[1]/button[2]

# -----------Page 1-----------
${CONTACT_PERSON_FIRST_NAME1}=                   xpath=//*[@id="app"]/div[4]/div[2]/div/div/div[1]/section/main/div/div[2]/div[2]/div/div[1]/span[1]/div[1]/input
${CONTACT_PERSON_FIRST_NAME2}=                   xpath=//*[@id="app"]/div[4]/div[2]/div/div/div[1]/section/main/div/div[2]/div[2]/div/div[2]/span[1]/div[1]/input
${CONTACT_PERSON_FIRST_NAME3}=                   xpath=//*[@id="app"]/div[4]/div[2]/div/div/div[1]/section/main/div/div[2]/div[2]/div/div[3]/span[1]/div[1]/input
${CONTACT_PERSON_LAST_NAME1}=                    xpath=//*[@id="app"]/div[4]/div[2]/div/div/div[1]/section/main/div/div[2]/div[2]/div/div[1]/span[2]/div[1]/input
${CONTACT_PERSON_LAST_NAME2}=                    xpath=//*[@id="app"]/div[4]/div[2]/div/div/div[1]/section/main/div/div[2]/div[2]/div/div[2]/span[2]/div[1]/input
${CONTACT_PERSON_LAST_NAME3}=                    xpath=//*[@id="app"]/div[4]/div[2]/div/div/div[1]/section/main/div/div[2]/div[2]/div/div[3]/span[2]/div[1]/input

${ORGANIZATION_NAME_INPUT_FIELD}=                xpath=//*[@id="app"]/div[4]/div[2]/div/div/div[1]/section/main/div/div[2]/div[1]/div[1]/input
${CONTACT_PERSON_FIRST_NAME_BASE_XPATH}=         xpath=//*[@id="app"]/div[4]/div[2]/div/div/div[1]/section/main/div/div[2]/div[2]/div/div[{index}]/span[1]/div[1]/input
${CONTACT_PERSON_LAST_NAME_BASE_XPATH}=          xpath=//*[@id="app"]/div[4]/div[2]/div/div/div[1]/section/main/div/div[2]/div[2]/div/div[{index}]/span[2]/div[1]/input
${CONTACT_PERSON_CIVILITY_BASE_XPATH}            xpath=//*[@id="app"]/div[4]/div[2]/div/div/div[1]/section/main/div/div[2]/div[2]/div/div[{index}]/span[3]/div[1]/select
${CONTACT_PERSON_PHONE_BASE_XPATH}=              xpath=//*[@id="app"]/div[4]/div[2]/div/div/div[1]/section/main/div/div[2]/div[2]/div/div[{index}]/span[4]/div[1]/input
${CONTACT_PERSON_EMAIL_BASE_XPATH}=              xpath=//*[@id="app"]/div[4]/div[2]/div/div/div[1]/section/main/div/div[2]/div[2]/div/div[{index}]/span[5]/div[1]/input
${CONTACT_PERSON_FUNCTION_BASE_XPATH}=           xpath=//*[@id="app"]/div[4]/div[2]/div/div/div[1]/section/main/div/div[2]/div[2]/div/div[{index}]/span[6]/div[1]/select
${TOTAL_INPUTS}=                                 3
@{NAMES}                                         Alice    Bob    Carol
@{EMPTY_LIST}                                   ${EMPTY}    ${EMPTY}    ${EMPTY}
@{LAST_NAMES}                                    Smith    Johnson    Doe
@{CIVILITIES}                                    Other    Ms.    Mr.
@{PHONES}                                        9024567890    9027654321    9027924680
@{EMAILS}                                        example1@1.com    example2@2.com    example3@3.com 
@{FUNCTIONS}                                     president    coordinator    administrator

${FIRST_NAME_INPUT_FIELD}=                       xpath=//*[@id="app"]/div[4]/div[2]/div/div/div[1]/section/main/div/div[2]/div[2]/div/div[1]/span[1]/div[1]/input
${LAST_NAME_INPUT_FIELD}=                        xpath=//*[@id="app"]/div[4]/div[2]/div/div/div[1]/section/main/div/div[2]/div[2]/div/div[1]/span[2]/div[1]/input
${PHONE_INPUT_FIELD}=                            xpath=//*[@id="app"]/div[4]/div[2]/div/div/div[1]/section/main/div/div[2]/div[2]/div/div[1]/span[4]/div[1]/input
${EMAIL_INPUT_FIELD}=                            xpath=//*[@id="app"]/div[4]/div[2]/div/div/div[1]/section/main/div/div[2]/div[2]/div/div[1]/span[5]/div[1]/input
# -----------Page 2-----------
${PROVINCE_DROPDOWN}=                            xpath=//*[@id="app"]/div[4]/div[2]/div/div/div[1]/section/main/div/div[2]/div[1]/div[1]/select
${ORG_TYPE_DROPDOWN}=                            xpath=//*[@id="app"]/div[4]/div[2]/div/div/div[1]/section/main/div/div[2]/div[2]/div[1]/select
${LEGAL_NAME_TEXTFIELD}=                         xpath=//*[@id="app"]/div[4]/div[2]/div/div/div[1]/section/main/div/div[2]/div[3]/div[1]/input
${PHONE_NUMBER_TEXTFIELD}=                       xpath=//*[@id="app"]/div[4]/div[2]/div/div/div[1]/section/main/div/div[2]/div[4]/div[1]/input
${EMAIL_OF_ORG_TEXTFIELD}=                       Xpath=//*[@id="app"]/div[4]/div[2]/div/div/div[1]/section/main/div/div[2]/div[5]/div[1]/input
${SUB_SECTOR_DROPDOWN}=                          xpath=//*[@id="app"]/div[4]/div[2]/div/div/div[1]/section/main/div/div[2]/div[6]/div[1]/select
${PRIMARY_FOCUS_DROPDOWN}=                       xpath=//*[@id="app"]/div[4]/div[2]/div/div/div[1]/section/main/div/div[2]/div[7]/div[1]/select
${ADDITIONAL_FOCUS_TEXTAREA}=                    xpath=//*[@id="app"]/div[4]/div[2]/div/div/div[1]/section/main/div/div[2]/div[8]/div/textarea
# -----------Page 3-----------
${Q4-SELECT}=                                    xpath=//*[@id="app"]/div[4]/div[2]/div/div/div[1]/section/main/div/div[2]/div[4]/div[1]/select
# -----------Page 4-----------
${NUMBER_OF_PEOPLE_INPUT}=                       xpath=//*[@id="app"]/div[4]/div[2]/div/div/div[1]/section/main/div/div[2]/div[2]/div[1]/input
${OTHER_CHECKBOX_PAGE4}=                         xpath=//*[@id="app"]/div[4]/div[2]/div/div/div[1]/section/main/div/div[2]/div[5]/div[2]/label/input
${Q3-SELECT}=                                    xpath=//*[@id="app"]/div[4]/div[2]/div/div/div[1]/section/main/div/div[2]/div[3]/div[1]/select
${Q4_CHECKBOX_PAGE4}=                            xpath=//*[@id="app"]/div[4]/div[2]/div/div/div[1]/section/main/div/div[2]/div[4]/label[5]/input
${Q5_CHECKBOX_PAGE4}=                            xpath=//*[@id="app"]/div[4]/div[2]/div/div/div[1]/section/main/div/div[2]/div[5]/label[1]/input
${Q6_CHECKBOX_PAGE4}=                            xpath=//*[@id="app"]/div[4]/div[2]/div/div/div[1]/section/main/div/div[2]/div[6]/label[1]/input
# -----------Page 5-----------
${ADDRESS_TEXTAREA}=                             xpath=//*[@id="app"]/div[4]/div[2]/div/div/div[1]/section/main/div/div[2]/div[1]/div[1]/textarea
${APT_TEXTFIELD}=                                xpath=/html/body/div/div[4]/div[2]/div/div/div[1]/section/main/div/div[2]/div[2]/div/input
${CITY_TEXTFIELD}=                               xpath=/html/body/div/div[4]/div[2]/div/div/div[1]/section/main/div/div[2]/div[3]/div[1]/input
${POSTCODE_TEXTFIELD}=                           xpath=//*[@id="app"]/div[4]/div[2]/div/div/div[1]/section/main/div/div[2]/div[4]/div[1]/input
# -----------Page 6-----------
${DATE_OF_INCORP}=                               xpath=//*[@id="app"]/div[4]/div[2]/div/div/div[1]/section/main/div/div[2]/div[1]/div[1]/input
${DATE_OF_LAST_FINANCIAL}=                       xpath=//*[@id="app"]/div[4]/div[2]/div/div/div[1]/section/main/div/div[2]/div[2]/div[1]/input
${PRIVATE_DONATION_INT}=                         xpath=/html/body/div/div[4]/div[2]/div/div/div[1]/section/main/div/div[2]/div[3]/div/div/span[1]/div[1]/div/input
${PUBLIC_DONATION_INT}=                          xpath=//*[@id="app"]/div[4]/div[2]/div/div/div[1]/section/main/div/div[2]/div[3]/div/div/span[2]/div[1]/div/input
${GRANTS_INT}=                                   xpath=//*[@id="app"]/div[4]/div[2]/div/div/div[1]/section/main/div/div[2]/div[3]/div/div/span[3]/div[1]/div/input
${SELF_GENERATED_INT}=                           xpath=//*[@id="app"]/div[4]/div[2]/div/div/div[1]/section/main/div/div[2]/div[3]/div/div/span[4]/div[1]/div/input
${TOTAL_INCOME_SUM}=                             xpath=//*[@id="app"]/div[4]/div[2]/div/div/div[1]/section/main/div/div[2]/div[3]/div/div/span[5]/div/div/input
${TOTAL_PAYROLL_INT}=                            xpath=//*[@id="app"]/div[4]/div[2]/div/div/div[1]/section/main/div/div[2]/div[3]/div/div/span[6]/div[1]/div/input
${YEARLY_BALANCE_INT}=                           xpath=//*[@id="app"]/div[4]/div[2]/div/div/div[1]/section/main/div/div[2]/div[3]/div/div/span[7]/div[1]/div/input
${PLUS_BUTTON_PAGE6}=                            xpath=//*[@id="app"]/div[4]/div[2]/div/div/div[1]/section/main/div/div[2]/div[3]/div/div/button[1]
${MINUS_BUTTON_PAGE6}=                           xpath=//*[@id="app"]/div[4]/div[2]/div/div/div[1]/section/main/div/div[2]/div[3]/div/div/button[2]

${EMP_FULLTIME_ASOF_INT}=                        xpath=//*[@id="app"]/div[4]/div[2]/div/div/div[1]/section/main/div/div[3]/div[1]/div[1]/input
${EMP_PARTTIME_ASOF_INT}=                        xpath=//*[@id="app"]/div[4]/div[2]/div/div/div[1]/section/main/div/div[3]/div[2]/div[1]/input
${VOL_FULLTIME_ASOF_INT}=                        xpath=//*[@id="app"]/div[4]/div[2]/div/div/div[1]/section/main/div/div[3]/div[3]/div[1]/input
${VOL_PARTTIME_ASOF_INT}=                        xpath=//*[@id="app"]/div[4]/div[2]/div/div/div[1]/section/main/div/div[3]/div[4]/div[1]/input
${EMP_FULLTIME_INT}=                             xpath=//*[@id="app"]/div[4]/div[2]/div/div/div[1]/section/main/div/div[4]/div[1]/div[1]/input
${EMP_PARTTIME_INT}=                             xpath=//*[@id="app"]/div[4]/div[2]/div/div/div[1]/section/main/div/div[4]/div[2]/div[1]/input
${VOL_FULLTIME_INT}=                             xpath=//*[@id="app"]/div[4]/div[2]/div/div/div[1]/section/main/div/div[4]/div[3]/div[1]/input
${VOL_PARTTIME_INT}=                             xpath=//*[@id="app"]/div[4]/div[2]/div/div/div[1]/section/main/div/div[4]/div[4]/div[1]/input
${BOARD_MEMBERS_INT}=                            xpath=//*[@id="app"]/div[4]/div[2]/div/div/div[1]/section/main/div/div[4]/div[5]/div[1]/input

${WEB_ADDRESS_URL_INPUT}=                              xpath=//*[@id="app"]/div[4]/div[2]/div/div/div[1]/section/main/div/div[5]/div[1]/div[1]/input
${FACEBOOK_URL_INPUT}=                                 xpath=//*[@id="app"]/div[4]/div[2]/div/div/div[1]/section/main/div/div[5]/div[2]/div[1]/input
${LINKEDIN_URL_INPUT}=                                 xpath=//*[@id="app"]/div[4]/div[2]/div/div/div[1]/section/main/div/div[5]/div[3]/div[1]/input
${INSTAGRAM_URL_INPUT}=                                xpath=//*[@id="app"]/div[4]/div[2]/div/div/div[1]/section/main/div/div[5]/div[4]/div[1]/input
${OTHER_URL_INPUT}=                                    xpath=//*[@id="app"]/div[4]/div[2]/div/div/div[1]/section/main/div/div[5]/div[5]/div[1]/input

*** Keywords ***

Navigate To Submitted Applications
    bnfinapp.Login as User Type    LEAD_REVIEWER    0
    bnfinApp.Ensure Element Is Clickable And Click    ${SIDE_NAV_APPLICATIONS_DROPDOWN}
    bnfinApp.Ensure Element Is Clickable And Click    ${SIDE_NAV_SUBMITTED_LINK}
    Wait Until Page Contains    Submitted Applications

Start "APPLICATION - STAGE 1"
    Scroll Element Into View    ${APPLICATION_STAGE1_LINK}
    bnfinApp.Ensure Element Is Clickable And Click    ${APPLICATION_STAGE1_LINK}
    Wait Until Page Contains    Your first step will be to complete Stage 1 of the application process
    bnfinApp.Ensure Element Is Clickable And Click    ${BEGIN_APPLICATION_BUTTON}

Start "APPLICATION - STAGE 1" From Another Grant    
    Scroll Element Into View    xpath=(//a[contains(@href, "/eligibility")])[2] 
    bnfinApp.Ensure Element Is Clickable And Click    xpath=(//a[contains(@href, "/eligibility")])[2] 
    Wait Until Page Contains    Your first step will be to complete Stage 1 of the application process
    bnfinApp.Ensure Element Is Clickable And Click    ${BEGIN_APPLICATION_BUTTON}

Add Extra Field
    Click Button    ${PLUS_BUTTON}

Remove Extra Field
    Click Button    ${MINUS_BUTTON}

Enter Organization Name
    [Arguments]    ${ORGANIZATION_NAME}
    Input Text    ${ORGANIZATION_NAME_INPUT_FIELD}    ${ORGANIZATION_NAME}

Enter Contact Persons First Names
    [Documentation]    Enter first names for contact persons in multiple input fields.
    [Arguments]    ${name1}    ${name2}    ${name3}
    Input Text    ${CONTACT_PERSON_FIRST_NAME1}    ${name1}
    Input Text    ${CONTACT_PERSON_FIRST_NAME2}    ${name2}
    Input Text    ${CONTACT_PERSON_FIRST_NAME3}    ${name3}

Enter Contact Persons Last Names
    [Documentation]    Enter last names for contact persons in multiple input fields.
    [Arguments]    ${lname1}    ${lname2}    ${lname3}
    Input Text    ${CONTACT_PERSON_LAST_NAME1}    ${lname1}
    Wait Until Element Is Visible    ${CONTACT_PERSON_LAST_NAME2}    timeout=10s
    Input Text    ${CONTACT_PERSON_LAST_NAME2}    ${lname2}
    Wait Until Element Is Visible    ${CONTACT_PERSON_LAST_NAME3}    timeout=10s
    Input Text    ${CONTACT_PERSON_LAST_NAME3}    ${lname3}

# Enter Contact Persons First Names
#     [Documentation]    Enter first names for contact persons in multiple input fields.
#     [Arguments]    ${names_list}
#     ${end_index}=    Evaluate    ${TOTAL_INPUTS} + 1
#     FOR    ${INDEX}    IN RANGE    1    ${end_index}
#         ${current_xpath}=    Set Variable    ${CONTACT_PERSON_FIRST_NAME_BASE_XPATH.replace("{index}", "${INDEX}")}
#         Fill In TextField(Clears Existing Text)    ${current_xpath}    ${names_list[${INDEX - 1}]}
#     END

# Enter Contact Persons Last Names
#     [Documentation]    Enter first names for contact persons in multiple input fields.
#     [Arguments]    ${last_names_list}
#     ${end_index}=    Evaluate    ${TOTAL_INPUTS} + 1
#     FOR    ${INDEX}    IN RANGE    1    ${end_index}
#         ${current_xpath}=    Set Variable    ${CONTACT_PERSON_LAST_NAME_BASE_XPATH.replace("{index}", "${INDEX}")}
#         Input Text    ${current_xpath}    ${last_names_list[${INDEX - 1}]}
#     END

Enter Contact Persons Civilities
    [Documentation]    Enter civilities for contact persons in multiple select fields.
    [Arguments]    ${civilities_list}
    ${end_index}=    Evaluate    ${TOTAL_INPUTS} + 1
    FOR    ${INDEX}    IN RANGE    1    ${end_index}
        ${current_xpath}=    Set Variable    ${CONTACT_PERSON_CIVILITY_BASE_XPATH.replace("{index}", "${INDEX}")}
        Wait Until Element Is Visible    ${current_xpath}    timeout=10s
        Select From List By Value    ${current_xpath}    ${civilities_list[${INDEX - 1}]}
    END

Enter Contact Persons Phones
    [Documentation]    Enter phones for contact persons in multiple input fields.
    [Arguments]    ${phones_list}
    ${end_index}=    Evaluate    ${TOTAL_INPUTS} + 1
    FOR    ${INDEX}    IN RANGE    1    ${end_index}
        ${current_xpath}=    Set Variable    ${CONTACT_PERSON_PHONE_BASE_XPATH.replace("{index}", "${INDEX}")}
        Input Text    ${current_xpath}    ${phones_list[${INDEX - 1}]}
    END

Enter Contact Persons Emails
    [Documentation]    Enter emails for contact persons in multiple input fields.
    [Arguments]    ${emails_list}
    ${end_index}=    Evaluate    ${TOTAL_INPUTS} + 1
    FOR    ${INDEX}    IN RANGE    1    ${end_index}
        ${current_xpath}=    Set Variable    ${CONTACT_PERSON_EMAIL_BASE_XPATH.replace("{index}", "${INDEX}")}
        Input Text    ${current_xpath}    ${emails_list[${INDEX - 1}]}
    END

Enter Contact Persons Functions
    [Documentation]    Enter functions for contact persons in multiple select fields.
    [Arguments]    ${functions_list}
    ${end_index}=    Evaluate    ${TOTAL_INPUTS} + 1
    FOR    ${INDEX}    IN RANGE    1    ${end_index}
        ${current_xpath}=    Set Variable    ${CONTACT_PERSON_FUNCTION_BASE_XPATH.replace("{index}", "${INDEX}")}
        Wait Until Element Is Visible    ${current_xpath}    timeout=10s
        Select From List By Value    ${current_xpath}    ${functions_list[${INDEX - 1}]}
    END

Field Char Limit Test
    [Arguments]    ${field_xpath}    ${value}    ${char_limit}
    Input Text    ${field_xpath}    ${value}
    ${actual_length}=    Get Length of Field Value    ${field_xpath}
    ${actual_length}=    Convert To Integer    ${actual_length}
    Should Be True    ${actual_length} <= ${char_limit}    msg=Field should not accept more than ${char_limit} characters


Get Length of Field Value
    [Arguments]    ${locator}
    ${value}=    Get Value    ${locator}
    ${length}=    Get Length    ${value}
    RETURN   ${length}

Select Province
    [Arguments]    ${province}
    Select From List By Value    ${PROVINCE_DROPDOWN}    ${province}

Select Organization Type
    [Arguments]    ${org_type}
    Select From List By Value    ${ORG_TYPE_DROPDOWN}    ${org_type}

Enter Legal Name
    [Arguments]    ${legal_name}
    Input Text    ${LEGAL_NAME_TEXTFIELD}    ${legal_name}

Enter Phone Number
    [Arguments]    ${phone_number}
    Input Text    ${PHONE_NUMBER_TEXTFIELD}    ${phone_number}

Enter Email Of Organization
    [Arguments]    ${email}
    Input Text    ${EMAIL_OF_ORG_TEXTFIELD}    ${email}

Select Sub Sector
    [Arguments]    ${sub_sector}
    Select From List By Value    ${SUB_SECTOR_DROPDOWN}    ${sub_sector}

Select Primary Focus
    [Arguments]    ${primary_focus}
    Select From List By Value    ${PRIMARY_FOCUS_DROPDOWN}    ${primary_focus}

Enter Additional Focus
    [Arguments]    ${additional_focus}
    Input Text    ${ADDITIONAL_FOCUS_TEXTAREA}    ${additional_focus}


Input Dates
    [Arguments]    ${date_of_incorp}            ${date_of_last_financial}
    Input Text     ${DATE_OF_INCORP}            ${date_of_incorp}
    Input Text     ${DATE_OF_LAST_FINANCIAL}    ${date_of_last_financial}

Enter Financial Information
    [Arguments]    ${private_donation}    ${public_donation}    ${grants}    ${self_generated}    ${total_payroll}    ${yearly_balance}
    Input Text    ${PRIVATE_DONATION_INT}    ${private_donation}
    Input Text    ${PUBLIC_DONATION_INT}     ${public_donation}
    Input Text    ${GRANTS_INT}              ${grants}
    Input Text    ${SELF_GENERATED_INT}      ${self_generated}
    Input Text    ${TOTAL_PAYROLL_INT}       ${total_payroll}
    Input Text    ${YEARLY_BALANCE_INT}      ${yearly_balance}

Calculate Total Income
    [Arguments]    ${private_donation}    ${public_donation}    ${grants}    ${self_generated}
    ${total_income}=    Evaluate    ${private_donation} + ${public_donation} + ${grants} + ${self_generated}
    Input Text    ${TOTAL_INCOME_SUM}    ${total_income}

Enter Employee Information
    [Arguments]    ${emp_fulltime_asof}    ${emp_parttime_asof}    ${vol_fulltime_asof}    ${vol_parttime_asof}    ${emp_fulltime}    ${emp_parttime}    ${vol_fulltime}    ${vol_parttime}    ${board_members}
    Input Text    ${EMP_FULLTIME_ASOF_INT}    ${emp_fulltime_asof}
    Input Text    ${EMP_PARTTIME_ASOF_INT}    ${emp_parttime_asof}
    Input Text    ${VOL_FULLTIME_ASOF_INT}    ${vol_fulltime_asof}
    Input Text    ${VOL_PARTTIME_ASOF_INT}    ${vol_parttime_asof}
    Input Text    ${EMP_FULLTIME_INT}         ${emp_fulltime}
    Input Text    ${EMP_PARTTIME_INT}         ${emp_parttime}
    Input Text    ${VOL_FULLTIME_INT}         ${vol_fulltime}
    Input Text    ${VOL_PARTTIME_INT}         ${vol_parttime}
    Input Text    ${BOARD_MEMBERS_INT}        ${board_members}

Enter Social URLs
    [Arguments]    ${web_address}    ${facebook}    ${linkedin}    ${instagram}    ${other}
    Input Text    ${WEB_ADDRESS_URL_INPUT}    ${web_address}
    Input Text    ${FACEBOOK_URL_INPUT}       ${facebook}
    Input Text    ${LINKEDIN_URL_INPUT}       ${linkedin}
    Input Text    ${INSTAGRAM_URL_INPUT}      ${instagram}
    Unselect Frame
    Input Text    ${OTHER_URL_INPUT}          ${other}

Enter Date Of Incorporation
    [Arguments]    ${incorp_date}
    Input Text    ${DATE_OF_INCORP}   ${incorp_date}

Enter Date Of Last Financial Statement
    [Arguments]    ${statement_date}
    Input Text    ${DATE_OF_LAST_FINANCIAL}    ${statement_date}