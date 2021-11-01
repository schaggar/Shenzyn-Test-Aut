*** Settings ***
Library    SeleniumLibrary

*** Variables ***

*** Keywords ***
LoginID
    input text    xpath=//input[@id='emailId']  ${LOGIN_ID}

LoginPassword
    input text    xpath=//input[@id='password']  ${LOGIN_PASSWORD}
