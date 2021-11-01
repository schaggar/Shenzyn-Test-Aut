*** Settings ***
Documentation  This is a testcase for partner registration
Library  SeleniumLibrary

*** Variables ***
${browser}  chrome
${url}  http://partner.stage.shenzyn.com/


*** Test Cases ***
Test registration
    Go to partner page

*** Keywords ***
Go to partner page
    Open browser    ${url}  ${browser}
    Maximize Browser Window
    click element   //*[@id="app"]/div/div/div/section/div[2]/section/p[1]/a
    input text      //*[@id="companyName"]     Shenzyn
    input text      //*[@id="address"]     She@1234
    #dropdown       //*[@id="countrycode"]/div/div/ul/li/div/input
    input text      //*[@id="contactNo"]    9663649011
    input text      //*[@id="emailId"]     sharanya.d@shenzyn.com
    input text      //*[@id="gstin"]    abc12345dstg
    select from list by value   //*[@id="partnertype"]/div/div     Training partner
    #input text      //*[@id="partnertype"]/div/div
    click element   //*[@id="signup-agreement"]
    click button    //*[@id="app"]/div/div/div/section/div[2]/section/form/div[8]/div/div/span/button
    close browser

