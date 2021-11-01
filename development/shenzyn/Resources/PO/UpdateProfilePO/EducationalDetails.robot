*** Settings ***
Library    SeleniumLibrary    timeout=60s

*** Variables ***

*** Keywords ***
Validate PageObjects
#    BuiltIn.sleep    5s
#    element text should be    //div[contains(text(),'Education Details')]    Education Details
#    element text should be    //label[contains(text(),'Highest Qualification')]    Highest Qualification
#    element text should be    //label[contains(text(),'Degree')]    Degree
#    element text should be    //label[contains(text(),'Specialization')]    Specialization
#    element text should be    //label[contains(text(),'Institute')]    Institute
#    element text should be    //label[contains(text(),'Education Type')]    Education Type
#    element text should be    //label[contains(text(),'Passing Year and Month')]    Passing Year and Month
#    click element    //div[2]/div[1]/div[1]/span[1]/button[1]
#    builtin.sleep    2s
#    click element    //div[2]/div[7]/div[1]/div[1]/span[1]/button[1]
#    page should contain element    //button[@class='ant-btn']
#    page should contain element    //button[@class='ant-btn ant-btn-primary']/span[contains(text(),'Next')]
    builtin.sleep    5s
#    page should contain element    //label[contains(text(),'Highest Qualification')]
#    page should contain element    //label[contains(text(),'Degree')]
    page should contain element    //input[@id='specialization-0']
    page should contain element    //input[@id='institute-0']
#Remove Extra Objects
    click element    (//span[@class='ant-form-item-children']/button)[2]

#Highest Qualification
#    wait until page contains    Highest Qualification
#    click element    xpath=//div[@id='highestQualification-0']/div[1]
#    BuiltIn.sleep    2s
#    click element    xpath=//li[contains(text(),'Intermediate')]
#
#Degree
#    clear element text    //div[1]/ul[1]/li[1]/div[1]/input[1]
#    input text    //div[1]/ul[1]/li[1]/div[1]/input[1]    ${DEGREE}

Specialization
    clear element text    //input[@id='specialization-0']
    input text    //input[@id='specialization-0']    ${SPECIALIZATION}
Institute
    clear element text    //input[@id='institute-0']
    input text    //input[@id='institute-0']    ${INSTITUTE}
#Education Type
#    click element    xpath=//div[@id='educationType-0']//div[contains(@class,'ant-select-selection__rendered')]
#    BuiltIn.sleep    2s
#    click element    //li[contains(text(),'Full Time')]
#
#Passing Year and Month
#    click element    //div[6]/div[2]/div[1]/span[1]/div[1]/span[1]/div[1]/input[1]
#    builtin.sleep    2s
#    click element    //div[contains(text(),'26')]

Highest Qualification 2
    click element    xpath=(//div[@class='ant-select-selection__rendered'])[4]
    click element    xpath=//li[contains(text(),'Higher Secondary')]
    click element    xpath=(//div[@class='ant-select-selection__rendered'])[5]
    click element    xpath=//body[1]/div[4]/div[1]/div[1]/div[1]/ul[1]/li[1]
    input text    //input[@id='specialization-1']    Testing
    input text    //input[@id='institute-1']    Testing

NextPage
    click element    (//button[contains(text(),'')])[3]
    BuiltIn.sleep    5s
