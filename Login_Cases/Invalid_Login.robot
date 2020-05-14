*** Settings ***

Library           SeleniumLibrary
Suite Setup       Open Browser To Zwing | Vendor
Suite Teardown    Close Browser
Test Setup        Go To Zwing | Vendor
Test Template     Login With Invalid Credentials Should Fail

*** Variables ***
${BROWSER}        chrome
${USER}           testorg2@zwing.in
${PASSWORD}       123456 
${LOGIN URL}      https://test.console.gozwing.com/admin/
${WELCOME URL}    https://test.console.gozwing.com/admin/home
${ERROR URL}      https://test.console.gozwing.com/admin/



`

*** Test Cases ***               USER NAME        PASSWORD
Invalid Username                 invalid          ${PASSWORD}
Invalid Password                 ${USER}          invalid
Invalid Username And Password    invalid          whatever
Empty Username                   ${EMPTY}         ${PASSWORD}
Empty Password                   ${USER}          ${EMPTY}
Empty Username And Password      ${EMPTY}         ${EMPTY}



*** Keywords ***
Login With Invalid Credentials Should Fail
    [Arguments]    ${username}    ${password}
    Input Username    ${username}
    Input Password    ${password}
    Submit Credentials
    Login Should Have Failed

Login Should Have Failed
    Location Should Be    ${ERROR URL}
    Title Should Be    Zwing | Vendor

Open Browser To Zwing | Vendor
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Zwing | Vendor Should Be Open

Zwing | Vendor Should Be Open
    Title Should Be    Zwing | Vendor

Go To Zwing | Vendor
    Go To    ${LOGIN URL}
    Zwing | Vendor Should Be Open

Input Username
    [Arguments]    ${username}
    Input Text    name:identity    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    name:password    ${password}

Submit Credentials
    Click Button    class:btn

Welcome Page Should Be Open
    Location Should Be    ${WELCOME URL}
    Title Should Be    Welcome Page
