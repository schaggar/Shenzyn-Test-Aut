*** Settings ***
Documentation  This is a testcase for partner to see the submitted profiles for a job
Resource    ../../../Resources/PO/HiringPartner_PO/CommonFunctionality.robot
Resource    ../../../Resources/PO/HiringPartner_PO/UserDefinedkeywords.robot

*** Variables ***

#*** Test Cases ***
#Test login
#    Start testcase
#    Login as Admin
#    Check profiles submitted for a job
#    Check profiles submitted for a event
#    End testcase

*** Keywords ***
Check profiles submitted for a job
    wait until element is visible    //tr[1]/td[1]/p    timeout=120s
    click element   //tr[1]/td[1]/p
    log to console    Job profiles are available and visible to admin
    log    Job profiles are available and visible to admin
    click element    //body/div[2]/div[1]/div[2]/div[1]/div[2]/button[1]/span[1]/i[1]/*[1]

Check profiles submitted for a event
    wait until element is visible    //div[contains(text(),'Events')]    timeout=120s
    log to console    reached 1 ....
    click element   //div[contains(text(),'Events')]
    log to console    reached 2 ....
    log to console    Event profiles are available and visible to admin
    log    Event profiles are available and visible to admin


