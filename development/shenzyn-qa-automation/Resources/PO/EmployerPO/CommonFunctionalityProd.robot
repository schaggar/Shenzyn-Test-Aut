*** Settings ***
Library  SeleniumLibrary

*** Keywords ***

Start TestCases
    Open Browser  https://employer.shenzyn.com/#/user/login  headlessfirefox
    Maximize Browser Window

Finish TestCase
    Close Browser