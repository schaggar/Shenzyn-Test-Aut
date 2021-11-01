*** Settings ***
Library    SeleniumLibrary

*** Variables ***

*** Keywords ***
Validate PageObjects
    BuiltIn.sleep    5s

Skills
    builtin.sleep    5s
#    clear element text    //input[@id='skillName-0']
#    input text    //input[@id='skillName-0']    Cloud Computing
    click element    //div[2]/div[1]/div[1]/div[1]/span[1]/button[1]
    click element    //div[2]/div[1]/div[1]/div[1]/span[1]/button[1]
    builtin.sleep    5s

Languages
    clear element text    //*[@id='language-0']
    input text    //*[@id='language-0']    Hindi, English, Punjabi
#    click element    (//*[@id="app-content"]/div/div/div/div/div/section/article/div[2]/section/form/div[25]/fieldset/div[2]/div[2]/div/span/ul/li/div)[4]

Bio
    clear element text    //textarea[@id='briefBio']
    input text    //textarea[@id='briefBio']    Testing Bio field.

NextPage
    click element    //div[1]/div[1]/section[1]/article[1]/div[3]/button[2]
