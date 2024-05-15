*** Settings ***
Resource    ../Resources/PO/SignIn.robot
Resource    ../Resources/PO/HomeDashboard.robot
Resource    ../Resources/PO/PublicPages.robot

*** Variables ***
${EMPTY_STRING}=                 ${EMPTY}
${LOREM_IPSUM}=                  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam nec purus 

${VALID_EMAIL}=                  victoria.shmakov+@curbza.com
${NOT_IN_SYSTEM_EMAIL}=          iamaninvalidaemail@example.com
${INVALID_EMAIL_FORMAT}=         invalidemail@

${VALID_PASSWORD}=               password123pass
${INVALID_PASSWORD}=             aaaaaaaaaaaa

${INVALID_FIELD_STRING}          ${101*"a"}
${INVALID_PARAGRAPH_STRING}      ${7501*"b"}

${VALID_URL_FORMAT}=             https://www.example.com
${INVALID_URL_FORMAT}=           www.example

${VALID_PHONE}=                  9025678900
${INVALID_PHONE_FORMAT}=         123456789

${VALID_POSTAL_CODE}=            A1A 1A1
${INVALID_POSTAL_CODE_FORMAT}=   123456

${VALID_NUMERIC_FIELD}=          150000
${INVALID_NUMERIC_FIELD}=        150000.00

${INVALID_TEXT}=                 I am a text input

${EXPECTED_RESET_URL}=    ${EMPTY}
*** Keywords ***
Login as User Type
    [Arguments]    ${user_type}    ${user_index}=0
    ${email}=    Run Keyword If    '${user_type}'=='ADMIN'    Set Variable    ${USER_ADMIN}
    ...    ELSE IF    '${user_type}'=='LEAD_REVIEWER'    Set Variable    ${USER_LEAD_REVIEWER}[${user_index}]
    ...    ELSE IF    '${user_type}'=='REVIEWER'    Set Variable    ${USER_REVIEWER}[${user_index}]
    ...    ELSE IF    '${user_type}'=='APPLICANT'    Set Variable    ${USER_APPLICANT}[${user_index}]
    ...    ELSE    Set Variable    ${None}
    ${password}=    Set Variable    ${PASSWORD}
    SignIn.Go To Login Page
    SignIn.Login With Valid Credentials    ${email}    ${password}
    Go to "Home" Dashboard

# ----------------------------------------------------------------
#              GENERATE RANDOM DATA TO BE REUSED IN TESTS
# ----------------------------------------------------------------
Create Random String Of Length
    [Arguments]    ${length}
    ${random_string}=    Evaluate    ''.join(random.choices(string.ascii_letters + string.digits, k=int(${length})))    random, string
    RETURN    ${random_string}


# Decide what length string you want to create
# To call: ${string100}=    Create String Of Length    100
Create String Of Length
    [Arguments]    ${length}
    ${generated_string}=    Evaluate    'a' * int(${length})
    RETURN    ${generated_string}

# Decide what length number you want to create, this will create a string made up of integers
Create String Number Of Length
    [Arguments]    ${length}
    ${generated_string}=    Evaluate    '1' * ${length}    globals()
    RETURN   ${generated_string}

# Decide what length integer you want to create, this will create an integer
Create Integer Of Length
    [Arguments]    ${length}
    ${generated_string}=    Evaluate    int('1' * int(${length}))
    RETURN    ${generated_string}

Create Random Integer Of Length
    [Arguments]    ${length}
    ${min_value}=    Evaluate    10**(int(${length})-1)    # Minimum value for the length
    ${max_value}=    Evaluate    (10**int(${length})) - 1    # Maximum value for the length
    ${random_number}=    Evaluate    random.randint(${min_value}, ${max_value})    random
    RETURN    ${random_number}

# generates the current date in the format specified
# To use:  ${today}=    Get Current Date 
# Log    Today's Date: ${today}
Get Current Date
    [Arguments]    ${format}=%Y-%m-%d
    ${current_date}=    Get Time    ${format}
    RETURN    ${current_date}

# generates a date in the future or past based on the number of days offset
# ${next_week}=    Get Relative Date    7    %Y-%m-%d
# Log    Date Next Week: ${next_week} 20/02/40502
Get Relative Date
    [Arguments]    ${days_offset}    ${format}=%Y-%m-%d
    ${offset_date}=    Evaluate    (datetime.datetime.now() + datetime.timedelta(days=${days_offset})).strftime('${format}')    datetime
    RETURN     ${offset_date}


Select Date From Picker
    [Arguments]    ${day}    ${month}    ${year}
    Click Element    id:datePickerField
    Select From List By Label    id:monthDropdown    ${month}
    Select From List By Label    id:yearDropdown    ${year}
    Click Element    xpath://*[@class='day' and text()='${day}']

#  ${random_email}=    Create Random Email    12    7
Create Random Email
    [Arguments]    ${local_part_length}=10    ${domain_part_length}=5
    ${local_part}=    Evaluate    ''.join(random.choices(string.ascii_letters + string.digits, k=int(${local_part_length})))    random, string
    ${domain_part}=    Evaluate    ''.join(random.choices(string.ascii_lowercase + string.digits, k=int(${domain_part_length})))    random, string
    ${email}=    Set Variable    ${local_part}@${domain_part}.com
    RETURN    ${email}

# --------------------------------------------------------------------------

Fill In TextField(Clears Existing Text)
    [Documentation]    Fills in a text field with the specified value, clears all existing text.
    [Arguments]    ${locator}    ${value}
    Wait Until Element Is Visible    ${locator}    10s
    Clear Element Text    ${locator}
    Input Text    ${locator}    ${value}

Fill In TextField
    [Documentation]    Fills in a text field with the specified value.
    [Arguments]    ${locator}    ${value}
    Wait Until Element Is Visible    ${locator}    10s
    Input Text    ${locator}    ${value}


Go to "Home" Dashboard
    HomeDashboard.Navigate To Dash
    HomeDashboard.Verify Page Loaded

Ensure Element Is Clickable And Click
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}    10s
    Wait Until Element Is Enabled    ${locator}    10s
    Click Element    ${locator}


Check If Element Exists
    [Arguments]    ${locator}
    ${exists}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${locator}    5s
    RETURN    ${exists}



User Should See Page Title
    [Arguments]    ${expected_title}
    ${actual_title}=    Get Title
    Should Be Equal    ${actual_title}    ${expected_title}


Page Should Not Have Changed
    [Arguments]    ${expected_url}
    ${current_url}=    Get Location
    Should Be Equal    ${current_url}    ${expected_url}

User Should See Error Message
    [Arguments]    ${error_message}
    Wait Until Page Contains    ${error_message}    timeout=10s
    RETURN    ${TRUE}

User Should Not See Error Message
    [Arguments]    ${error_message}
    Wait Until Page Contains    ${error_message}    timeout=10s
    RETURN    ${FALSE}

Check For Field Error
    [Arguments]    ${error_locator}    ${expected_error_text}
    ${is_visible}=    Run Keyword And Return Status    Page Should Contain Element    ${error_locator}   timeout=10s
    Run Keyword If    ${is_visible}    Fail    "Error Detected: ${expected_error_text}"

    

Go To "Sign Up" Page From "Sign In" Page
    SignIn.Go To Login Page
    ${button_exists}=    Check If Element Exists    ${SIGNUP_BUTTON}
    Run Keyword If    ${button_exists}    Click Sign Up Button
    ...    ELSE    Fail    "Sign Up button does not exist"
    Verify Page Loaded

Go To "Sign In" Page From "Sign Up" Page
    PublicPages.Navigate To "Sign Up" Page
    ${button_exists}=    Check If Element Exists    ${LOGIN_BUTTON_LINK}
    Run Keyword If    ${button_exists}    Click Sign In Button
    ...    ELSE    Fail    "Sign In button does not exist"
    Verify Page Loaded

Go To "Home Page" From "Sign Up" Page
    PublicPages.Navigate To "Sign Up" Page
    ${button_exists}=    Check If Element Exists    ${BNFIN_BUTTON}
    Run Keyword If    ${button_exists}    Navigate To "Home" Page
    ...    ELSE    Fail    "BNFIN button does not exist"

Clear All Inputs
    @{input_elements}=    Get Webelements    //input
    FOR    ${element}    IN    @{input_elements}
        ${is_visible}=    Run Keyword And Return Status    Element Should Be Visible    ${element}
        ${is_disabled}=    Get Element Attribute    ${element}    disabled
        ${is_read_only}=    Get Element Attribute    ${element}    readonly
        # Check if the element is not disabled and not read-only
        Run Keyword If    '${is_visible}'=='PASS' AND '${is_disabled}'=='None' AND '${is_read_only}'=='None'
        ...    Clear Element Text    ${element}

    END

Reset All Selects to Default
    @{select_elements}=    Get Webelements    //select
    FOR    ${select}    IN    @{select_elements}
        Select From List By Value    ${select}    ${EMPTY}
    END

Clear Checkboxes
    @{checkboxes}=    Get Webelements    //input[@type='checkbox']
    FOR    ${checkbox}    IN    @{checkboxes}
        Unselect Checkbox    ${checkbox}
    END
