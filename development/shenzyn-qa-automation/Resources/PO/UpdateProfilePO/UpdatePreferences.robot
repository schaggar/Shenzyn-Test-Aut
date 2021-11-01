*** Settings ***
Library    SeleniumLibrary

*** Variables ***

*** Keywords ***
Validate PageObjects
    BuiltIn.sleep    5s

Company Size
    wait until page contains    Company Size
    click element    //div[1]/div[1]/div[2]/div[1]/span[1]/div[1]/div[1]/div[1]
    BuiltIn.sleep    1s
    click element    //li[contains(text(),'Startups (1-100)')]
#Top Companies

Desired CTC
    clear element text    //div[2]/div[1]/span[1]/div[1]/div[1]/div[2]/input[1]
    input text    //div[2]/div[1]/span[1]/div[1]/div[1]/div[2]/input[1]    10

#Preferred Location(s)

Preffered Benefits
    click element    //tbody/div[2]/div[3]/span[1]
    click element    //tbody/div[3]/div[2]/span[1]/span[1]/img[1]

NextPage
    click element    //div[1]/section[1]/article[1]/div[3]/button[2]
