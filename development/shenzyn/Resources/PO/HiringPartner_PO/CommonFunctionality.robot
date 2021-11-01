*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${browser}  firefox
${url}  http://partner.stage.shenzyn.com/

*** Keywords ***
Start testcase
    Open browser    ${url}  ${browser}
    Maximize Browser Window

End testcase
    Close Browser