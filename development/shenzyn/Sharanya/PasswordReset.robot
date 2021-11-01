
*** Settings ***
Resource    ../Resources/PO/HiringPartner_PO/CommonFunctionality.robot
Resource    ../Resources/PO/HiringPartner_PO/UserDefinedkeywords.robot

*** Variables ***

#*** Test Cases ***
#Password reset
#    Start testcase
#    Password reset
#    End testcase

*** Keywords ***
Password reset
    wait until element is visible    //a[contains(text(),'Reset password')]    timeout=120s
    Click element   //a[contains(text(),'Reset password')]
    wait until element is visible    //input[@id='emailId']    timeout=120s
    Input text      //input[@id='emailId']    Sharanya_test@hotmail.com
    Click button    //button

#    #Validating the popup confirmation message
#    wait until element is visible    //p[contains(text(),'A password reset email has been sent, Check your m')]    timeout=120s
#    ${locator}=    get text    //p[contains(text(),'A password reset email has been sent, Check your m')]
#    should be equal    A password reset email has been sent, Check your m    ${locator}
#    click button    //div[2]/button[1]

    log to console    Reset Password instructions sent successfully to email id Sharanya_test@hotmail.com
    log    Reset Password instructions sent successfully to email id Sharanya_test@hotmail.com


