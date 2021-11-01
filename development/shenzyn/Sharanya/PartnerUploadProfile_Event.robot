*** Settings ***
Documentation  This is a testcase for uploading profile for an event

Resource    ../Resources/PO/HiringPartner_PO/CommonFunctionality.robot
Resource    ../Resources/PO/HiringPartner_PO/UserDefinedkeywords.robot
#
#*** Test Cases ***
#Test login and upload profile for an event
#    Start testcase
#    Login as Admin
#    Upload profile for event
#    End testcase

*** Variables ***
${IMAGE_FILE_PATH} =  /var/opt/Shenzyn-apps/Shenzyn-Test-Aut/static/images10.jpg
${RESUME} =  /var/opt/Shenzyn-apps/Shenzyn-Test-Aut/static/Priyanka_kalyankar_resume.docx

*** Keywords ***

Upload profile for event
    wait until element is visible    //div[contains(text(),'Events')]    timeout=120s
    click element  //div[contains(text(),'Events')]
    wait until element is visible    (//tr[1]/td[1]/p[@class='hyperlink'])[2]    timeout=120s
    click element   (//tr[1]/td[1]/p[@class='hyperlink'])[2]
    wait until element is visible    //button[@class = 'ant-btn']    timeout=120s
    click button    (//button[@class = 'ant-btn'])[1]

    #candidate details
    wait until element is visible    //p[@class = 'ant-upload-hint']    timeout=120s
    #click element  //p[@class = 'ant-upload-hint']
    log to console    uploading resume test
    #Upload Resume
    choose file    //input[@type='file']    ${RESUME}
    log to console    resume upload successful
    wait until element is visible    //input[@id='name']    timeout=120s
    wait until element is enabled    //input[@id='name']    timeout=120s
    clear element text    //input[@id='name']
    input text  //input[@id='name']     Sharanya
    clear element text    //input[@id='email']
    input text  //input[@id='email']    sharanya2311d@gmail.com
    input text  //*[@id="contactno"]    9663649011
    input text  //*[@id="exp"]      5
    input text  //*[@id="currentcompany"]   Shenzyn
    input text  //*[@id="expectedCTC"]      5
    input text  //*[@id="noticePeriod"]     60

    #click button    xpath:/html/body/div[3]/div/div[2]/div/div[2]/div/section/form/div[9]/div[2]/div/div/div/span/button
    click button     //button[.//text() = 'Submit']
    log to console    profile uploaded for event successfully.
    log    profile uploaded for event successfully.