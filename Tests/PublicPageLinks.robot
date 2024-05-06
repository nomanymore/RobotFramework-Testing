*** Settings ***
Documentation  This testing suite will check for the functionality of all links on the publicly available website
Resource  ../Resources/Common.robot
Resource  ../Resources/PO/PublicPages.robot
Resource  ../Resources/bnfinApp.robot
Test Setup  Common.Begin Web Test
Test Teardown  Common.End Web Test

# ---------------------------------------------------------------------------
# THIS TEST WILL CHECK THE FUNCTIONALITY OF ALL LINKS ON THE PUBLIC WEBSITE
# ---------------------------------------------------------------------------


# To run script: robot -d results/publiclinks tests/publicpagelinks.robot

*** Variables ***

*** Test Cases ***

# ------------------------------ Test Links on Public Pages ------------------------------
Test Home Page Link
    [Documentation]    Verify the home page link
    [Tags]             Links
    PublicPages.Navigate To "Home" Page

Test About Us Page Link
    [Documentation]    Verify the "About Us" page link
    [Tags]             Links
    PublicPages.Navigate To "About Us" Page

Test Contact Us Page Link
    [Documentation]    Verify the "Contact Us" page link
    [Tags]             Links
    PublicPages.Navigate To "Contact Us" Page

Test "Grants" Page Link
    [Documentation]    Verify the "Grants" page link
    [Tags]             Links
    PublicPages.Navigate To "Grants" Page

Test "Sign Up" Page Link
    [Documentation]    Verify the "Sign Up" page link
    [Tags]             Links
    PublicPages.Navigate To "Sign Up" Page
    go to                       ${HOMEPAGE_URL}
    Click Element               ${JOIN_NOW_BUTTON}
    wait until page contains    ${SIGNUP_SUBTITLE}

Test "Cookie Policy" Page Link
    [Documentation]    Verify the "Cookie Policy" page link
    [Tags]             Links
    PublicPages.Navigate To "Cookie Policy" Page

Test "Privacy Policy" Page Link
    [Documentation]    Verify the "Privacy Policy" page link
    [Tags]             Links
    PublicPages.Navigate To "Privacy Policy" Page

Test "Terms of Use" Page Link
    [Documentation]    Verify the "Terms of Use" page link
    [Tags]             Links
    PublicPages.Navigate To "Terms of Use" Page

Test "Disclaimer" Page Link
    [Documentation]    Verify the "Disclaimer" page link
    [Tags]             Links    Disclaimer
    PublicPages.Navigate To "Disclaimer" Page

Test "Facebook" Page Link
    [Documentation]    Verify the "Facebook" page link
    [Tags]             Links    Socials
    PublicPages.Navigate To "Facebook" Page

Test "X/Twitter" Page Link
    [Documentation]    Verify the "X/Twitter" page link
    [Tags]             Links    Socials
    PublicPages.Navigate To "X/Twitter" Page

Test "Instagram" Page Link
    [Documentation]    Verify the "Instagram" page link
    [Tags]             Links    Socials
    PublicPages.Navigate To "Instagram" Page

# ------------------------------ Test Language Toggle ------------------------------

Test Language Toggle
    [Documentation]    Verify the page turns from English to French and vice versa
    [Tags]             Language
    PublicPages.Change Language


# ------------------------------ Test links between sing-in and sign-up --------------

User Should Be Able To Go To "Sign Up" Page From "Sign In" Page
    [Documentation]    Navigate to the sign-up page from the sign-in page
    [Tags]             Links    Sign In    Sign Up
    bnfinApp.Go To "Sign Up" Page From "Sign In" Page

User Should Be Able To Go To "Sign In" Page From "Sign Up" Page
    [Documentation]    Navigate to the sign-in page from the sign-up page
    [Tags]             Links    Sign In    Sign Up
    bnfinApp.Go To "Sign In" Page From "Sign Up" Page

User Should Be Able To Go To To "Home Page" From "Sign Up" Page
    [Documentation]    Navigate to the home page from the sign-up page
    [Tags]             Links    Home Page    Sign Up
    bnfinApp.Go To "Home Page" From "Sign Up" Page