*** Settings ***
Library    SeleniumLibrary
#Library    ReactLibrary

*** Keywords ***
Begin Web Test
    open browser    about:blank    ${BROWSER}

End Web Test
    close browser
