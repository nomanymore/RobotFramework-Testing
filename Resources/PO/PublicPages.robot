*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${HOMEPAGE_URL}=             https://bnfin-staging.curbza.com
${ABOUT_US_URL}=             https://bnfin-staging.curbza.com/about-info
${GRANTS_URL}=               https://bnfin-staging.curbza.com/grants-info
${CONTACT_US_URL}=           https://bnfin-staging.curbza.com/contact-info
${SIGN_UP_URL}=              https://bnfin-staging.curbza.com/sign-up
${PRIVACY_POLICY_URL}=       https://bnfin-staging.curbza.com/privacy-policy
${TERMS_OF_USE_URL}=         https://bnfin-staging.curbza.com/terms-of-use
${COOKIE_POLICY_URL}=        https://bnfin-staging.curbza.com/cookie-policy
${FACEBOOK_URL}=             https://www.facebook.com/
${TWITTER_URL}=              https://twitter.com/
${INSTAGRAM_URL}=            https://www.instagram.com/
${DISCLAIMER_URL}=           https://bnfin-staging.curbza.com/disclaimer

${HOME_SUBTITLE}=            Funding, Support and Community
${ABOUT_SUBTITLE}=           xpath=//*[@id="intermediaries"]/h1
${GRANTS_SUBTITLE}=          xpath=//*[@id="grants"]/h1
${CONTACT_TITLE}=            xpath=//*[@id="app"]/section[1]/h1
${SIGNUP_SUBTITLE}=          Create an account
${PRIVACY_POLICY_TITLE}=     Privacy Policy
${TERMS_OF_USE_TITLE}=       Platform Terms of Service
${COOKIE_POLICY_TITLE}=      Cookie Policy for BNFIN
${FACEBOOK_TITLE}=           Facebook
${TWITTER_TITLE}=            X
${INSTAGRAM_TITLE}=          Instagram
${DISCLAIMER_TITLE}=         Disclaimer Policy

${TWITTER_BUTTON}=           xpath=//*[@id="footer"]/div/div[1]/div[1]/div/a[2]/img
${INSTAGRAM_BUTTON}=         xpath=//*[@id="footer"]/div/div[1]/div[1]/div/a[3]/img
${FACEBOOK_BUTTON}=          xpath=//*[@id="footer"]/div/div[1]/div[1]/div/a[1]/img


*** Keywords ***

Navigate To "Home" Page
    go to                       ${HOMEPAGE_URL}
    wait until page contains    ${HOME_SUBTITLE}

Navigate To "About Us" Page
    go to                       ${ABOUT_US_URL}
    Wait Until Element Is Visible    ${ABOUT_SUBTITLE}

Navigate To "Grants" Page
    go to                       ${GRANTS_URL}
    Wait Until Element Is Visible   ${GRANTS_SUBTITLE}

Navigate To "Contact Us" Page
    go to                       ${CONTACT_US_URL}
    Wait Until Element Is Visible   ${CONTACT_TITLE}

Navigate To "Sign Up" Page
    go to                       ${SIGN_UP_URL}
    wait until page contains    ${SIGNUP_SUBTITLE}

Navigate To "Privacy Policy" Page
    go to                       ${PRIVACY_POLICY_URL}
    wait until page contains    ${PRIVACY_POLICY_TITLE}

Navigate To "Cookie Policy" Page
    go to                       ${COOKIE_POLICY_URL}
    wait until page contains    ${COOKIE_POLICY_TITLE}

Navigate To "Terms Of Use" Page
    go to                       ${TERMS_OF_USE_URL}
    wait until page contains    ${TERMS_OF_USE_TITLE}

Navigate To "Facebook" Page
    Click Element               ${FACEBOOK_BUTTON}
    wait until page contains    ${FACEBOOK_TITLE}

Navigate To "Instagram" Page
    Click Element               ${TWITTER_BUTTON}
    wait until page contains    ${INSTAGRAM_TITLE}

Navigate To "X/Twitter" Page
    Click Element               ${INSTAGRAM_BUTTON}
    wait until page contains    ${TWITTER_TITLE}

Navigate To "Disclaimer" Page
    go to                       ${DISCLAIMER_URL}
    wait until page contains    ${DISCLAIMER_TITLE}