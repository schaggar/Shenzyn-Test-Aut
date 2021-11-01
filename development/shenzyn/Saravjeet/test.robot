*** Settings ***
Documentation    Jobseeker Automation Test suite
Library    SeleniumLibrary    timeout=20s
Library    pyautogui
Library    ImageHorizonLibrary

*** Variables ***
#${locator}    //div/input[@placeholder='Select date']
${locator}    css:input.ant-calendar-picker-input
${Yeterday_Date} =      Get Current Date    result_format=%d/%m/%Y    increment=-100 day

*** Test Cases ***
User should be able to Create the Account
    [Documentation]    User should be able to create and verify the account
    [Tags]    Smoke
    open browser    http://js.stage.shenzyn.com/  firefox
    Wait Until Page Contains    Wear your superwoman cape and fly high
    MAXIMIZE BROWSER WINDOW
    input text    xpath=//input[@id='emailId']    saravjeet.singh@hotmail.com
    input text    xpath=//input[@id='password']    s33rat@123
    click element    //span[contains(text(),'Remember me')]
    click button    //button[@class='ant-btn btn-cta btn-block ant-btn-primary']
    builtin.sleep    5s
    wait until page contains element    //span[contains(text(),'Recommended Jobs')]
    click element    //div[@class='ant-menu-submenu-title']//span//span[@class='nav-text'][contains(text(),'Profile')]
    wait until page contains    Update Profile
    BuiltIn.sleep    5s
    click element    //li//li[1]//a[1]
    builtin.sleep    5s
#-----
    #Personal Details
    page should contain element    //span[contains(text(),'Profile Picture')]
    page should contain element    //span[contains(text(),'Upload Resume')]
##Resume Upload
#    click element    //p[contains(text(),'Drag or Click to Upload')]
#    BuiltIn.sleep    1s
#    pyautogui.typewrite    C:\\Users\\Inderjeet\\Desktop\\Saravjeet\\Shenzyn\\static\\saravjeet.doc
#    BuiltIn.sleep    2s
#    ImageHorizonLibrary.Press Combination   Key.enter
#    wait until element is not visible    //span[contains(text(),'saravjeet.doc')]
#
##Video Upload
#    click element    //div[2]/div[1]/div[1]/span[1]/span[1]/div[1]/span[1]/button[1]
#    builtin.sleep    1s
#    pyautogui.typewrite
#    builtin.sleep    2s
#    ImageHorizonLibrary.Press Combination   Key.enter
#    wait until element is not visible    //span[contains(text(),'big_buck_bunny_720p_1mb.mp4')]
#
#    #Educational Details
#    click element    //div[contains(text(),'Education Details')]
#    builtin.sleep    5s
#    page should contain element    //label[contains(text(),'Highest Qualification')]
#    page should contain element    //label[contains(text(),'Degree')]
#    page should contain element    //input[@id='specialization-0']
#    page should contain element    //input[@id='institute-0']
#
#    builtin.log to console    //span[@class='ant-form-item-children']
#    click element    (//span[@class='ant-form-item-children']/button)[2]
#    builtin.sleep    2s
#    clear element text    //input[@id='specialization-0']
#    input text    //input[@id='specialization-0']    Computers
#    clear element text    //input[@id='institute-0']
#    input text    //input[@id='institute-0']    SSCET
#    click element    (//button[contains(text(),'')])[3]

#----dATE PICKER CODE
#    click element     ${locator}
##    Input Text    ${locator}    ${Yeterday_Date}
#
#    execute javascript    document.querySelector("${locator}").removeAttribute("readonly");
#    execute javascript    document.querySelector("${locator}").removeAttribute("onchange");
#    execute javascript    document.querySelector("${locator}").setAttribute("value", "${Yeterday_Date}");

    builtin.sleep    2s
    click element    //div[contains(text(),'Employment Details')]
    click element    (//input[@placeholder='Select date'])[1]
    builtin.sleep    1s
    repeat keyword    10 times    Previous Month Employment
    builtin.sleep    1s
    click element    //div[contains(text(),'20')]

*** Keywords ***
Previous Month Employment
    click element    //a[@class='ant-calendar-prev-year-btn']


