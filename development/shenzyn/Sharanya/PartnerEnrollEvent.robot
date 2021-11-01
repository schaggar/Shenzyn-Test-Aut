*** Settings ***
Library    SeleniumLibrary
Documentation  This is a testcase for enroll event
Resource    ../Resources/PO/HiringPartner_PO/CommonFunctionality.robot
Resource    ../Resources/PO/HiringPartner_PO/UserDefinedkeywords.robot

*** Variables ***


#*** Test Cases ***
#Test login
#    Start testcase
#    Login as Admin
#    Enroll for an event
#    End testcase

*** Keywords ***
Enroll for an event
    wait until element is visible    //div[contains(text(),'Events')]    timeout=120s
    click element  //div[contains(text(),'Events')]

    wait until element is visible   //*[@id="app-content"]/div/div/div[2]/div/div[3]/div[2]/div[2]/div[2]/div/section/div/div/div[1]/p[2]   timeout=120s
    click element   //*[@id="app-content"]/div/div/div[2]/div/div[3]/div[2]/div[2]/div[2]/div/section/div/div/div[1]/p[2]

#    wait until element is visible    //button[@class='ant-btn']    timeout=120s
#    @{webElements}=    get list items    //button[@class='ant-btn']
#    log to console    WEBELEMENTS    @{webElements}
    #Click Element | @{webElements[0]}

    wait until element is visible    //div[1]/div[1]/div[2]/div[2]/div[4]/div[1]/button[1]    timeout=120s
    click element    (//div[1]/div[1]/div[2]/div[2]/div[4]/div[1]/button[1])[1]

    #Validating toast messages
    wait until element is visible    //span[contains(text(),'Events Enrolled Successfully')]    timeout=120s
    ${message}=    get text    //span[contains(text(),'Events Enrolled Successfully')]
    #Testing the text present on the toast message
    should be equal    ${message}    Events Enrolled Successfully
    log to console    Events Enrolled Successfully
    log    Events Enrolled Successfully




