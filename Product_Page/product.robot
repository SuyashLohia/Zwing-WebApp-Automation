*** Settings ***
Library		SeleniumLibrary
# Suite Setup 	Go To HOMEPAGE
# Suite Teardown	Close All Browsers

*** Variables ***
${HOMEPAGE}	            https://test.console.gozwing.com/admin/
${BROWSER}              chrome

*** Test Cases ***

Open Browser
	Open Browser To Login Page
    Open Browser to Product and Categories 
 
*** Keywords ***
Open Browser To Login Page
    Open Browser    ${HOMEPAGE}    ${BROWSER}
    Maximize Browser Window
    Input Text      name:identity    testorg2@zwing.in       clear=True
    Input Password  name:password    123456                  clear =True
    Click Button    class:btn

Open Browser to Product and Categories 
    
    
    # Opening Product Page 
    Sleep                                           2s
    Click Element                                   //a[@class='phpdebugbar-close-btn']
    Wait Until Page Contains Element                class:fa-book
    Click Element                                   class:fa-book
    Click Link                                      link:Product


    # Add Product and then Back 
    Sleep                                           1s
    Click Element                                   //a[@class='btn btn-primary']
    Sleep                                           1s
    Click Element                                   //a[@class='btn btn-secondary']
    Sleep                                           1s
    Click Element                                   //a[@class='btn btn-primary']
    Input Text                                      //input[@placeholder='Enter item name']                 Suyash 
    Click Element                                   //a[@class='btn btn-secondary']
    Sleep                                           1s
    Click Element                                   //a[@class='btn btn-primary']

    Scroll Element Into View                        //button[contains(@class,'btn btn-primary')]
    Sleep                                           0.5s
    Click Button                                    //button[contains(@class,'btn btn-primary')] 
    











    Close Browser