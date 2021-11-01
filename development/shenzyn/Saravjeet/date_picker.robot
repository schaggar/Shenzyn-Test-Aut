*** Settings ***
Documentation    Date Picker Code
Library    SeleniumLibrary
Library    pyautogui

*** Variables ***
#${year}=    //a[@class='ant-calendar-year-select']
#${month}=    //a[@class='ant-calendar-month-select']
#${days}=    //div[@class='ant-calendar-date']
${year}=    //select[@class='react-datepicker__year-select']
${month}=    //select[@class='react-datepicker__month-select']
${day}=    //div[@class='ant-calendar-date']//div[@class='react-datepicker__day react-datepicker__day--019 react-datepicker__day--selected react-datepicker__day--today react-datepicker__day--weekend']

*** Test Cases ***
Testing Date Picker
    open browser    https://demoqa.com/date-picker    firefox
    MAXIMIZE BROWSER WINDOW
    builtin.sleep    5s
    click element    //input[@id='datePickerMonthYearInput']
    builtin.sleep    1s
    repeat keyword    15 times    Previous Month
#    log   get value    ${year}
*** Keywords ***
Previous Month
    click element    //button[contains(text(),'Previous Month')]


