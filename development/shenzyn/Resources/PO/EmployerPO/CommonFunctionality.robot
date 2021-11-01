*** Settings ***
Library  SeleniumLibrary

*** Keywords ***

Start TestCase
    Open Browser  http://employer.stage.shenzyn.com/#/user/login    firefox
    Maximize Browser Window

Finish TestCase
    Close Browser