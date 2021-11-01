*** Settings ***
Library  SeleniumLibrary

*** Keywords ***

Start TestCases
    Open Browser  https://employer.shenzyn.com/#/user/login  ff
    Maximize Browser Window

Finish TestCase
    Close Browser