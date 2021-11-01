*** Settings ***
Documentation    This is some basic information about the suite
Library    SeleniumLibrary

*** Variables ***

*** Test Cases ***
User should be able to login to the Jobseeker Portal
    [Documentation]    Test case description
    [Tags]    Smoke
    open browser    https://www.amazon.in   chrome
    sleep    2s
    input text    id=twotabsearchtextbox    iphone 11
    sleep    3s
    click button    css=#nav-search-submit-text > input
    close browser

*** Keywords ***


