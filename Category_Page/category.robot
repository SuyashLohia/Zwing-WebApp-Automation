*** Settings ***
Library		SeleniumLibrary
# Suite Setup 	Go To HOMEPAGE
# Suite Teardown	Close All Browsers

*** Variables ***
${HOMEPAGE}	            https://test.console.gozwing.com/admin/
${CATEGORIES_PAGE}      https://test.console.gozwing.com/admin/product/category
${BROWSER} 	chrome
${EXISTING_CATEGORY}    Menswear
${CATEGORY_NAME}        Mens2
${SUB_NAME}             Upperwear
${UPDATED_NAME}         Mens2Kids
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
    # Opening Categories Page 
    Sleep                                           2s
    Wait Until Page Contains Element                class:fa-book
    Click Element                                   class:fa-book
    Click Link                                      link:Categories
    
    # Adding Category Without Name
    Sleep                                           0.5s
    Click Button                                    id:addCategory
    Wait Until Element Is Visible                   //input[@placeholder='Category name']  
    Click Button                                    //*[@id="form"]/div[2]/button
    Sleep                                           1s
    Wait for Condition                              return document.getElementsByClassName('help-block')[0].innerText=='The name field is required.'

    # Adding Same Category 
    Input Text                                      //input[@placeholder='Category name']                                                           ${EXISTING_CATEGORY}
    Click Button                                    //*[@id="form"]/div[2]/button
    Sleep                                           1s
    Wait for Condition                              return document.getElementsByClassName('media-heading')[0].innerText=='Error'
    Wait Until Page Contains Element                class:alert-error
    Click Button                                    //div[@class='fade alert alert-error alert-dismissible in']//button[@class='close']

    
    # Adding Category     
    Input Text                                      //input[@placeholder='Category name']                                                           ${CATEGORY_NAME}
    Click Button                                    //*[@id="form"]/div[2]/button
    Sleep                                           1s    
    Wait Until Page Contains Element                class:alert-success
    Click Button                                    //div[@class='fade alert alert-success alert-dismissible in']//button[@class='close']
    
    
    # Adding Sub Category
    Click Element                                   //tr[1]//td[3]//div[1]//a[1]
    Wait Until Element Is Visible                   //input[@placeholder='Category name']      
    Input Text                                      //input[@placeholder='Category name']                                                           ${SUB_NAME}
    Click Button                                    //button[@class='btn btn-primary']
    Sleep                                           1.5s
    Wait Until Page Contains Element                class:alert-success
    Click Button                                    //div[@class='fade alert alert-success alert-dismissible in']//button[@class='close']
    
    
    # Editing Category Name 
    Click Element                                   //tr[1]//td[3]//div[1]//a[2]
    Wait Until Element Is Visible                   //input[@placeholder='Category name'] 
    Input Text                                      //input[@placeholder='Category name']                                                           ${UPDATED_NAME}
    Click Button                                    //button[@class='btn btn-primary']
    Sleep                                           1s
    Wait Until Page Contains Element                class:alert-success
    Click Button                                    //div[@class='fade alert alert-success alert-dismissible in']//button[@class='close']
    

    #Attempt to Delete Category
    Click Element                                   //tr[1]//td[3]//div[1]//a[3]
    Sleep                                           0.5s
    Click Button                                    //button[contains(text(),'OK')]
    Sleep                                           1.5s
    Wait Until Page Contains Element                class:alert-error
    Click Button                                    //div[@class='fade alert alert-error alert-dismissible in']//button[@class='close']

    
    # Deleting Sub Category
    Click Element                                   //tr[1]//td[3]//div[1]//a[4]
    Sleep                                           1s
    Wait Until Element Is Visible                   //tr[@id='332']//a[@class='text-danger btn-sm text-danger']
    Click Element                                   //tr[@id='332']//a[@class='text-danger btn-sm text-danger']
    Sleep                                           0.5s
    Click Button                                    //button[contains(text(),'OK')]
    Sleep                                           1s
    Wait Until Page Contains Element                class:alert-success
    Click Button                                    //div[@class='fade alert alert-success alert-dismissible in']//button[@class='close']
    

    #Deleting Category  
    Click Element                                   //tr[1]//td[3]//div[1]//a[3]
    Sleep                                           0.5s
    Click Button                                    //button[contains(text(),'OK')]
    Sleep                                           1.5s
    Wait Until Page Contains Element                class:alert-success
    Click Button                                    //div[@class='fade alert alert-success alert-dismissible in']//button[@class='close']
    
    #Searching using Query 
    Click Element                                   //input[@placeholder='Enter search query..']
    Input Text                                      //input[@placeholder='Enter search query..']                                                M 
    Sleep                                           0.5s
    Click Element                                   //a[@class='fa fa-close clear']

    #View Toggle 
    Sleep                                           0.5s
    Click Button                                    //div[@class='pull-left left-filters']//button[@class='button']
    Sleep                                           0.5s
    Click Element                                   //a[contains(text(),'20')]
    Sleep                                           0.5s
    Click Button                                    //div[@class='pull-left left-filters']//button[@class='button']
    Sleep                                           0.5s
    Scroll Element Into View                        //a[@class='page-link'][contains(text(),'1')]


    
    # Click Button                                    id:addCategory
    # Wait Until Element Is Visible                   //input[@placeholder='Category name']      
    # Input Text                                      //input[@placeholder='Category name']                                                         ${SUB_NAME}
    # Click Element                                   //*[@id="form"]/div[1]/div/div/div[2]/div/div/select
    
    
    # Mouse Over                                      css:select.form-control 
   # Mouse Down                                      css:select.form-control 
     # Execute Javascript                              let el=document.querySelector('select.form-control'); el.value=51; el.dispatchEvent(new Event('change'));
    # Select From List By Label                       css:select.form-control     Mens2
    # Wait For Condition                              return document.querySelector('select.form-control option:checked').value=='Mens2'
    # Click Button                                    //button[@class='btn btn-primary']
   # Wait Until Page Contains Element                class:alert-success
   # Click Button                                    //div[@class='fade alert alert-success alert-dismissible in']//button[@class='close']
  # //div[@class='fade alert alert-success alert-dismissible in']//span[contains(text(),'×')]
  # //div[@class='fade alert alert-success alert-dismissible in']//button[@class='close']
