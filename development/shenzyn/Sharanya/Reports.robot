*** Settings ***
Documentation  This is a testcase for partner subscription
Resource    ../Resources/PO/HiringPartner_PO/CommonFunctionality.robot
Resource    ../Resources/PO/HiringPartner_PO/UserDefinedkeywords.robot


#*** Test Cases ***
#Test subscription
#    Start testcase
#    Login as admin
#    View reports
#    End testcase

*** Keywords ***
View reports
    wait until element is visible    //*[@id="app-layout"]/section/div/header/div/div[2]/div/a    timeout=120s
    click link  //*[@id="app-layout"]/section/div/header/div/div[2]/div/a
    Builtin.sleep   4s
    click element   xpath=//i[@class ='anticon anticon-profile']
    Builtin.sleep   3s

