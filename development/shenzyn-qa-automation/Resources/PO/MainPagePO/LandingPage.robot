*** Settings ***
Library    SeleniumLibrary

*** Variables ***

*** Keywords ***
Load
    Go to   ${START_URL}

Verify Page Loaded
    MAXIMIZE BROWSER WINDOW
    wait until page contains    Wear your superwoman cape and fly high
    wait until page contains    Fasten your seat belt for a thrilling and successful career ride.
    wait until page contains    By logging using 3rd party medium, I agree the
    wait until page contains    Don't have an account yet? Sign up
    wait until page contains    Forgot your username or password? Reset password
    wait until page contains    Remember me

Validate the PageObjects
    wait until element is visible    //h1[contains(text(),'Wear your superwoman cape and fly high')]    timeout=120s
    element text should be    //h1[contains(text(),'Wear your superwoman cape and fly high')]   Wear your superwoman cape and fly high
    element text should be    //p[contains(text(),'Fasten your seat belt for a thrilling and successf')]   Fasten your seat belt for a thrilling and successful career ride.
    element text should be    //div[2]/section[1]/p[2]    By logging using 3rd party medium, I agree the Terms and Conditions
    element text should be    //div[2]/section[1]/p[3]    Don't have an account yet? Sign up
    element text should be    //div[2]/section[1]/p[4]    Forgot your username or password? Reset password
    element text should be    //span[contains(text(),'Remember me')]    Remember me
    page should contain textfield    //input[@id='emailId']
    page should contain textfield    //input[@id='password']
    page should contain link    //a[contains(text(),'Terms and Conditions')]
    page should contain link    //a[contains(text(),'Sign up')]
    page should contain link    //a[contains(text(),'Reset password')]
    page should contain element    //span[contains(text(),'Login with Gmail')]
    page should contain element    //span[contains(text(),'Login with LinkedIN')]
    page should contain element    //div[4]/div[1]/div[1]/span[1]/button[1]
    page should contain image    Shenzyn
    page should contain link    https://www.shenzyn.com/
    page should contain checkbox    //input[@id='login2-remember']

Validate Negative Login 1
    wait until element is visible    //input[@id='emailId']    timeout=120s
    input text    //input[@id='emailId']    xxxx
    input text    //input[@id='password']    12345
    click button    //button
    click button    //button
    wait until element is visible    //div[contains(text(),'Invalid input for emailId')]    timeout=120s
    ${validate_text}=    get text    //div[contains(text(),'Invalid input for emailId')]
    should be equal    ${validate_text}     Invalid input for emailId
    log to console    ${\n}"Invalid input for emailId, Result as Expected"
    log    "Invalid input for emailId, Result as Expected"

Validate Negative Login 2
    wait until element is visible    //input[@id='emailId']    timeout=120s
    input text    //input[@id='emailId']    xxxxxxx@123.com
    input text    //input[@id='password']    12345
    click button    //button
    click button    //button
    wait until element is visible    //div[contains(text(),'User not found')]    timeout=120s
    ${validate_text}=    get text    //div[contains(text(),'User not found')]
    should be equal    ${validate_text}     User not found
    log to console    ${\n}"User not found,Result as Expected"
    log    "User not found,Result as Expected"

Validate Negative Login 3
    wait until element is visible    //input[@id='emailId']    timeout=120s
    input text    //input[@id='emailId']    saravjeet.singh@hotmail.com
    input text    //input[@id='password']    12345
    click button    //button
    click button    //button
    wait until element is visible    //div[contains(text(),'Incorrect Password')]    timeout=120s
    ${validate_text}=    get text    //div[contains(text(),'Incorrect Password')]
    should be equal    ${validate_text}     Incorrect Password
    log to console    ${\n}"Incorrect Password, Result as Expected"
    log    "Incorrect Password, Result as Expected"

Validate Negative Login 4
    wait until element is visible    //input[@id='emailId']    timeout=120s
    #input text    //input[@id='emailId']
    input text    //input[@id='password']    12345
    click button    //button
    click button    //button
    wait until element is visible    //div[contains(text(),'Please input your emailId!')]    timeout=120s
    ${validate_text}=    get text    //div[contains(text(),'Please input your emailId!')]
    should be equal    ${validate_text}     Please input your emailId!
    log to console    ${\n}"Please input your emailId!, Result as Expected"
    log    "Please input your emailId!, Result as Expected"

Validate Negative Login 5
    wait until element is visible    //input[@id='emailId']    timeout=120s
    input text    //input[@id='emailId']    saravjeet.singh@hotmail.com
    #input text    //input[@id='password']
    click button    //button
    click button    //button
    wait until element is visible    //div[contains(text(),'Please input your Password!')]    timeout=120s
    ${validate_text}=    get text    //div[contains(text(),'Please input your Password!')]
    should be equal    ${validate_text}     Please input your Password!
    log to console    ${\n}"Please input your Password!, Result as Expected"
    log    "Please input your Password!, Result as Expected"
