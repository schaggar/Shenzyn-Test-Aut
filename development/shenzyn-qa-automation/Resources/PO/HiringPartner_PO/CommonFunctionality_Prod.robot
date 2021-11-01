*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${browser}  chrome
${url}  https://partner.shenzyn.com/

*** Keywords ***
Start testcase
    Open browser    ${url}  ${browser}
    Maximize Browser Window

End testcase
    Close Browser
