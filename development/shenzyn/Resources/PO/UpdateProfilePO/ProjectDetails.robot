*** Settings ***
Library    SeleniumLibrary
#Library    pyautogui
#Library    ImageHorizonLibrary
*** Variables ***

*** Keywords ***
Validate PageObjects
    builtin.sleep    5s
    wait until page contains    Certification Name
    element text should be    //div[contains(text(),'Projects Details')]    Projects Details
    element text should be    //label[contains(text(),'Certification Name')]    Certification Name
    element text should be    //label[contains(text(),'Certification authority')]    Certification authority
    element text should be    //label[contains(text(),'Project Title')]    Project Title
    element text should be    //label[contains(text(),'Skills Utilized')]    Skills Utilized
    element text should be    //label[contains(text(),'Patent Title')]    Patent Title
    element text should be    //label[contains(text(),'Publication Title')]    Publication Title
#    click element    (//button[@class='ant-btn ant-btn-primary'])[1]
#    click element    (//button[@class='ant-btn ant-btn-primary'])[2]
#    click element    (//button[@class='ant-btn ant-btn-primary'])[4]
#    click element    (//button[@class='ant-btn ant-btn-primary'])[5]
#    click element    (//button[@class='ant-btn ant-btn-primary'])[6]
#    click element    (//button[@class='ant-btn ant-btn-primary'])[7]

Certification Details
    clear element text    //input[@id='certificationName-0']
    input text    //input[@id='certificationName-0']    Microsoft Azure Data Engineer
    clear element text    //input[@id='certificationBody-0']
    input text    //input[@id='certificationBody-0']    Microsoft
#    #Check if Add More button is working
#    click button    //div[2]/div[1]/div[1]/div[1]/span[1]/button[1]
#    BuiltIn.sleep    2s
#    click button    //div[2]/div[1]/div[1]/div[1]/span[1]/button[1]

Project Details
    #Project Title
    clear element text    //input[@id='projectTitle-0']
    input text    //input[@id='projectTitle-0']     Automating Jobseeker Portal

    #Skills Utilized
#    click element    //div[@class='ant-select-selection__rendered']
#    builtin.sleep    2s
#    ImageHorizonLibrary.press combination    key.backspace
#    ImageHorizonLibrary.press combination    key.backspace
#    ImageHorizonLibrary.press combination    key.tab
#    builtin.sleep    3s
#    #input text    //div[@class='ant-select-selection__rendered']    Python, Java
#    clear element text    //textarea[@id='projectDescription-0']
#    input text    //textarea[@id='projectDescription-0']    Selenium Testing
#
#    input text    //div[2]/div[2]/div[1]/span[1]/div[1]/div[1]    Python
#    ImageHorizonLibrary.press combination    key.enter

Patent Details
    clear element text    //input[@id='patentTitle-0']
    input text    //input[@id='patentTitle-0']      Testing Patent
    click element    //input[@id='patentIssuedAuthority-0']
    input text    //input[@id='patentIssuedAuthority-0']    Issuing Authority Testing

Publication Details
    clear element text    //input[@id='publicationTitle-0']
    input text    //input[@id='publicationTitle-0']    Testing Publication Field
    clear element text    //input[@id='publicationLink-0']
    input text    //input[@id='publicationLink-0']      Publication Link

NextPage
    click button    //div[@class='steps-action']/button[2]
