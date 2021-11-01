*** Settings ***
Documentation  This is a testcase for uploading profile for an job

Resource    ../../../Resources/PO/HiringPartner_PO/CommonFunctionality.robot
Resource    ../../../Resources/PO/HiringPartner_PO/UserDefinedkeywords.robot


#*** Test Cases ***
#Test login and upload profile for a job
#    Start testcase
#    Login as Admin
#    Upload profile for job
#    End testcase

*** Keywords ***
Upload profile for job
    wait until element is visible    //tr[1]/td[1]/p    timeout=120s
    click element   //tr[1]/td[1]/p    #Upoad Button
    wait until element is visible    //button[@class = 'ant-btn']    timeout=120s
    click button    (//button[@class = 'ant-btn'])[1]
    wait until element is visible    //button[@class = 'ant-btn ant-btn-primary ant-btn-sm']    timeout=120s
    click button    //button[@class = 'ant-btn ant-btn-primary ant-btn-sm']
    #click element    xpath:/html/body/div[2]/div/div/div/div[2]/div/div/div[2]/button[2]/span

    #candidate details
    #click element   //p[@class = 'ant-upload-hint']
    #Upload resume
    choose file    //input[@type='file']    ${RESUME}
    wait until element is enabled    //*[@id="name"]    timeout=120s
    input text  //*[@id="name"]     Sharanya
    input text  //*[@id="email"]    sharanya2311d@gmail.com
    input text  //*[@id="contactno"]    9663649011
    input text  //*[@id="exp"]      5
    input text  //*[@id="expectedCTC"]      5
    input text  //*[@id="noticePeriod"]     60
    input text  //*[@id="lastcompany"]   Shenzyn
    click button    //button[.//text() = 'Submit']
    log to console    profile uploaded for job successfully.
    log    profile uploaded for job successfully.
