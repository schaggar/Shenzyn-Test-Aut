*** Settings ***
Documentation  This is a testcase for partner subscription
Resource    ../Resources/PO/HiringPartner_PO/CommonFunctionality.robot
Resource    ../Resources/PO/HiringPartner_PO/UserDefinedkeywords.robot


*** Test Cases ***
Test subscription
    Start testcase
    Login as admin
    Edit_profile
    End testcase

*** Keywords ***
Edit_profile
    click link  //*[@id="app-layout"]/section/div/header/div/div[2]/div/a
    Builtin.sleep   4s
    click element   xpath=//i[@class ='anticon anticon-edit']
    Builtin.sleep   3s
    input text  //*[@id="companyAddress"]       1192, 22nd Cross, 24th Main Rd, HSR Layout, Bengaluru, Karnataka 560102
    Builtin.sleep   2s
    input text  //*[@id="companyPhoneNo"]   9663649011
    Builtin.sleep   2s
    input text  //*[@id="gst"]  22AAAAA0000A1z5
    Builtin.sleep   2s
    click button     //button[.//text() = 'Submit']
    BuiltIn.sleep    5s
    element text should be  //p[contains(text(),'Profile updated successfully')]    Profile updated successfully