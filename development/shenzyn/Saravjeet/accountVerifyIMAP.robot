*** Settings ***
Documentation    Jobseeker Automation Test suite
Library    SeleniumLibrary
Library    ImapLibrary
Resource    ../Resources/CommonApp.robot
Test Setup    CommonApp.Begin Web Test
Test Teardown    CommonApp.End Web Test

*** Variables ***
${BROWSER} =    firefox

*** Test Cases ***
Email Verification
    Open Mailbox    host=imap.gmail.com    user=saravjeet3@gmail.com    password=1six1284
    ${LATEST} =    Wait For Email    sender=noreply@e.fiverr.com    timeout=300
    ${HTML} =    Open Link From Email    ${LATEST}
    Should Contain    ${HTML}    You're almost there! Just confirm your email
    sleep   10s
    Close Mailbox
*** Keywords ***


