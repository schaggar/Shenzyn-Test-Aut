
*** Settings ***
Resource    ../../../Resources/PO/HiringPartner_PO/CommonFunctionality.robot
Resource    ../../../Resources/PO/HiringPartner_PO/UserDefinedkeywords.robot

*** Variables ***
#
#*** Test Cases ***
#Test login and delete recruiter
#    Start testcase
#    Login as Admin
#    Delete recruiter
#    End testcase

*** Keywords ***
Delete recruiter
    Builtin.sleep   5s
    click element    //*[@id="app-content"]/div/div/div[2]/div/div[1]/div/div/div/div/div[1]/div[3]
    Builtin.sleep   5s
    Click element   //i[@class = 'anticon anticon-delete']
    Builtin.sleep   5s
    Click button    //button[.//text() = 'Yes']
    Builtin.sleep   2s

