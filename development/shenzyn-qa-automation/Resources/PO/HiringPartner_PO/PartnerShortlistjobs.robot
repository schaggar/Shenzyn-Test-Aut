*** Settings ***
Documentation  This is a testcase for partner shortlistjobs
Resource    ../../../Resources/PO/HiringPartner_PO/CommonFunctionality.robot
Resource    ../../../Resources/PO/HiringPartner_PO/UserDefinedkeywords.robot

#
#*** Test Cases ***
#Partner shortlist jobs as admin
#    Start testcase
#    Login as Admin
#    Shortlist jobs
#    End testcase

*** Keywords ***
Shortlist jobs
    set selenium speed    0.5
    wait until element is visible    //div[@class='JobStatsWrapper']/div/p[2]    timeout=120s
    click element   //div[@class='JobStatsWrapper']/div/p[2]
    wait until element is visible    //div[@class ='col-lg-2 col-md-2 col-sm-12 text-center']/img   timeout=120s
    click element    //div[@class ='col-lg-2 col-md-2 col-sm-12 text-center']/img
    wait until element is visible    xpath=//button[@class='ant-btn ant-btn-default']    timeout=120s
    click button    xpath=//button[@class='ant-btn ant-btn-default']

    #Validating toast messages
    wait until element is visible    //span[contains(text(),'Job Shortlisted SuccessFully !')]    timeout=120s
    ${message}=    get text    //span[contains(text(),'Job Shortlisted SuccessFully !')]
    #Testing the text present on the toast message
    should be equal    ${message}    Job Shortlisted SuccessFully !
    log to console    Job shortlisted successfully.






