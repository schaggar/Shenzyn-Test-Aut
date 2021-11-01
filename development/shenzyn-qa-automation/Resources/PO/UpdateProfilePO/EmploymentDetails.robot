*** Settings ***
Library    SeleniumLibrary

*** Variables ***

*** Keywords ***
Validate Fresher PageObjects
    BuiltIn.sleep    2s
    wait until page contains element    //label[@for='isFresher']
    element text should be    //label[contains(text(),'Are you fresher?')]    Are you fresher?
    element text should be    //label[contains(text(),'Achievements')]    Achievements
    page should contain checkbox    //input[@id='isFresher']

Fresher
    clear element text    //textarea[@id='employmentDescription-0']
    input text    //textarea[@id='employmentDescription-0']     Robot Framework Testing

Lateral Details
    click element    //input[@id='isFresher']

Lateral Page Object Validation
    element text should be    //label[contains(text(),'Current Designation')]
    element text should be    //label[contains(text(),'Current Company')]
    element text should be    //label[contains(text(),'Current CTC(in LPA)')]
    element text should be    //label[contains(text(),'From Date')]
    element text should be    //label[contains(text(),'On notice period?')]
    element text should be    //label[contains(text(),'Achievements')]


NextPage
    click button    //div[@class='steps-action']/button[2]

