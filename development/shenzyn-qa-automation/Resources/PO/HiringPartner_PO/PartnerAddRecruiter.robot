*** Settings ***
Resource    ../../../Resources/PO/HiringPartner_PO/CommonFunctionality.robot
Resource    ../../../Resources/PO/HiringPartner_PO/UserDefinedkeywords.robot

*** Variables ***

#*** Test Cases ***
#Test login and add recruiter
#    Start testcase
#    Login as Admin
#    Add a recruiter
#    End testcase

*** Keywords ***
Add a recruiter
    wait until element is visible    //div[contains(text(),'Recruiters')]    timeout=120s
    click element    //div[contains(text(),'Recruiters')]
    wait until element is visible    //button[@class = 'ant-btn']
    #Add Recruiter button
    click button   (//button[@class = 'ant-btn'])[1]
    #Uload button
    wait until element is visible    //div[@class='ant-upload-text']    timeout=120s
    choose file    //input[@type='file']    ${IMAGE_FILE_PATH}
    input text  //*[@id="name"]     Sharanya
    input text  //*[@id="mail"]     Sharanya_test@hotmail.com
    #input text  //*[@id="password"]     She@1234
    #input text //*[@id="countrycode"]/div/div/ul/li/div/input
    input text  //*[@id="contactno"]    9663649011
    input text  //*[@id="address"]      Mysore Rd, Jnana Bharathi, Bengaluru, Karnataka 560056
    input text  //*[@id="linkedin"]     linkedin.com/in/sharanya-d-881365170
    input text  //*[@id="location"]     Bangalore
    #click button    xpath=/html/body/div[6]/div/div[2]/div/div[2]/div/section/form/div[11]/div/div/span/button
    click button    //button[.//text() = 'Submit']
    log to console    Recruiter added successfully.
    log    Recruiter added successfully.
`
