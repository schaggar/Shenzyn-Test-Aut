*** Settings ***
Documentation  This is a testcase for partner login as admin and recruiter
#Resource    ../Resources/PO/HiringPartner_PO/CommonFunctionality.robot
#Resource    ../Resources/PO/HiringPartner_PO/UserDefinedkeywords.robot
Library  SeleniumLibrary
#
#*** Variables ***
#
#
#*** Test Cases ***
#Login
#    Start testcase
#    Login as admin
#    Admin signout
#    Login as recruiter
#    Recruiter signout
#    End testcase

*** Keywords ***
Admin signout
    set selenium speed    0.25
    wait until element is visible    //span[@class='ant-avatar ant-avatar-lg ant-avatar-circle ant-avatar-image']    timeout=120s
    click element  //span[@class='ant-avatar ant-avatar-lg ant-avatar-circle ant-avatar-image']
    #click link  xpath:/html/body/div[3]/div/div/ul/li[9]/a
    wait until element is visible    //li[11]/a[1]    timeout=120s
    click element    //li[11]/a[1]
    log to console    Admin Account Validated and Logged Out Successfully.
    log    Admin Account Validated and Logged Out Successfully.

Recruiter signout
    builtin.sleep    5s
    wait until element is visible    //span[@class='ant-avatar ant-avatar-lg ant-avatar-circle ant-avatar-image']    timeout=120s
    click element  //span[@class='ant-avatar ant-avatar-lg ant-avatar-circle ant-avatar-image']
    wait until element is visible    //div[1]/div[1]/ul[1]/li[4]/a[1]   timeout=120s
    click element    //div[1]/div[1]/ul[1]/li[4]/a[1]
    log to console    Recruiter Account Validated and Logged Out Successfully.
    log    Recruiter Account Validated and Logged Out Successfully.
