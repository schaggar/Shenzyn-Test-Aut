*** Settings ***
Documentation    Jobseeker Automation Test suite
Library    SeleniumLibrary
Library    ImapLibrary

*** Variables ***

*** Test Cases ***
User should be able to Create the Account
    [Documentation]    User should be able to create and verify the account
    [Tags]    Smoke
#   Account Verification
    open browser    https://outlook.live.com/owa/  chrome
    MAXIMIZE BROWSER WINDOW
    click element    xpath=//header/div[1]/aside[1]/div[1]/nav[1]/ul[1]/li[2]/a[1]
    input text    xpath=//input[@id='i0116']    seerat.chaggar@hotmail.com
    sleep    3s
    click element    xpath=//input[@id='idSIButton9']
    #wait until page contains    Use my Microsoft Authenticator app
    sleep    3s
    input text    xpath=//input[@id='i0118']    s33rat@123
    click element    css=#idSIButton9
    sleep    2s
    click element    css=#idSIButton9
    sleep    3s
    page should contain    Account Verification Token
    sleep    3s
    clear element text    Inbox
    click element    xpath=//*[@id="app"]/div/div/div/div/div/div[2]/div/div/div/div/div[2]/div[1]/div/div[3]/div/div/div/table/tbody/tr[3]/td/p[1]/a

#    close browser

*** Keywords ***


