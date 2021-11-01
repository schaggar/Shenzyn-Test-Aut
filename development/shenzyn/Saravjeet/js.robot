*** Settings ***
Documentation    Jobseeker Automation Test suite
Library    SeleniumLibrary

*** Variables ***

*** Test Cases ***
User should be able to Create the Account
    [Documentation]    User should be able to create and verify the account
    [Tags]    Smoke
#   Account Creation
    open browser    http://js.stage.shenzyn.com/  firefox
    Wait Until Page Contains    Wear your superwoman cape and fly high
    MAXIMIZE BROWSER WINDOW
    click element    xpath=//a[contains(text(),'Sign up')]
    wait until page contains    Wait Not, Procrastinate Not, Just Start
    input text    xpath=//input[@id='name']    Seerat Chaggar
    input text    xpath=//input[@id='emailId']    seerat.chaggar@hotmail.com
    input text    xpath=//input[@id='password']    s33rat@123
    input text    xpath=//input[@id='password-confirm']    s33rat@123
    click element    xpath=//input[@id='signup-agreement']
    click button    xpath=//button
    wait until page contains    Account Created Successfully, Please Check Your Inbox & Verify Your Mail!
    click button    xpath=//body/div[3]/div[1]/div[2]/div[1]/div[2]/div[1]/div[1]/div[2]/button[1]

#   Account Verification
    open browser    https://outlook.live.com/owa/  chrome
    click element    linktext=Sign in
    input text    xpath=//input[@id='i0116']    seerat.chaggar@hotmail.com
    click element    tagname=input
    input text    tagname=input    s33rat@123
    sleep    5s
    close browser

*** Keywords ***


