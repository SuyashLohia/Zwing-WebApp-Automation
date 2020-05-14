*** Settings ***
Library		SeleniumLibrary
# Suite Setup 	Go To HOMEPAGE
# Suite Teardown	Close All Browsers

*** Variables ***
${HOMEPAGE}	https://test.console.gozwing.com/admin/
${BROWSER} 	chrome
*** Test Cases ***

Open Browser
	Open Browser To Login Page
 
*** Keywords ***
Open Browser To Login Page
    Open Browser    ${HOMEPAGE}    ${BROWSER}
    Input Text      name:identity    testorg2@zwing.in       clear=True
    Input Password  name:password    123456                  clear =True
    Click Button    class:btn


