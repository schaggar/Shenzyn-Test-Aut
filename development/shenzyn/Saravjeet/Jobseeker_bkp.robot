*** Settings ***
Documentation    This is some basic information about the suite
Library    SeleniumLibrary

*** Variables ***

*** Test Cases ***
User should be able to login to the Jobseeker Portal
    [Documentation]    Test case description
    [Tags]    Smoke
#   Login Window
    open browser    http://js.stage.shenzyn.com/  chrome
    MAXIMIZE BROWSER WINDOW
    sleep    2s
    input text    xpath=//input[@id='emailId']  saravjeet.singh@hotmail.com
    input text    xpath=//input[@id='password']  s33rat@123
    click element    //span[contains(text(),'Remember me')]
    click button    //button[@class='ant-btn btn-cta btn-block ant-btn-primary']
    sleep    5s
    click element    //div[@class='ant-menu-submenu-title']//span//span[@class='nav-text'][contains(text(),'Profile')]
    sleep    1s
    click element    //li//li[1]//a[1]
    sleep    4s

User can update personal details
#   Page 1 Personal Details Page
#    clear element text    //input[@placeholder='Select date']
#    input text    //input[@placeholder='Select date']  16/12/1986
    clear element text    //input[@id='contactNo']
    input text    //input[@id='contactNo']  9975568427
    input text    //input[@id='linkedin']  Robot Automation
    input text    //input[@id='github']  Testing GIT
    click element    //div[@class='steps-action']//button[@class='ant-btn ant-btn-primary']
    sleep    3s
User can update Educational details
#   Page 2 - Education Details
#   Highest Qualification
    click element    //div[@id='highestQualification-0']/div[1]
    sleep    2s
    click element    //li[contains(text(),'Intermediate')]
    clear element text    //input[contains(@class,'ant-input ant-select-search__field')]
#  Specilization
    input text    //input[contains(@class,'ant-input ant-select-search__field')]  Computer Science
#  Institute
    clear element text    //input[@id='institute-0']
    input text    //input[@id='institute-0']  SSCET
#  Education Type
    click element    //div[@id='educationType-0']//div[contains(@class,'ant-select-selection__rendered')]
    sleep    2s
#    click element    //li[contains(@class,'ant-select-dropdown-menu-item ant-select-dropdown-menu-item-active')]
#    sleep    2s
#    click element    //li[contains(@class,'ant-select-dropdown-menu-item ant-select-dropdown-menu-item-active')]
# Passing Year and Months
#    click element    //input[contains(@placeholder,'Select date')]"
#    sleep    1s
    click element    //a[contains(@class,'ant-calendar-today-btn')]
    click button    //div[@class='steps-action']//button[@class='ant-btn ant-btn-primary']
    sleep    5s
    close browser

*** Keywords ***


