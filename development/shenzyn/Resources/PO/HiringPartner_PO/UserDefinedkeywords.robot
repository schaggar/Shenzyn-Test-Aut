*** Settings ***
Library    SeleniumLibrary
Library    pyautogui
Library    ImageHorizonLibrary

*** Variables ***
${IMAGE_FILE_PATH} =  C:\\gitclonenew\\Shenzyn-Test-Aut\\static\\Sharanya_files\\testing.jpg
${RESUME} =  C:\\gitclonenew\\Shenzyn-Test-Aut\\static\\Sharanya_files\\Resume.docx
${Admin_url} =    http://admin.stage.shenzyn.com/#/user/login
${browser} =    firefox

*** Keywords ***
Login as Admin
    wait until page contains element    //*[@id="emailId"]     timeout=120s
    input text   //*[@id="emailId"]     Arun.I@shenzyn.com
    input text  //*[@id="password"]     1204ai!!
    click button   //*[@id="app"]/div/div/div/section/div[2]/section/form/div[4]/div/div/span/button

Login as Admin on Prod
    wait until page contains element    //*[@id="emailId"]    timeout=120s
    input text   //*[@id="emailId"]     sharuhehe@gmail.com
    input text  //*[@id="password"]     She@1234
    click button    //*[@id="app"]/div/div/div/section/div[2]/section/form/div[4]/div/div/span/button
    BuiltIn.sleep   5s

Login as recruiter
    wait until element is visible    //input[@id='emailId']    timeout=120s
    wait until element is enabled    //input[@id='emailId']    timeout=120s
    input text   //input[@id='emailId']     sharanya2311d@gmail.com
    wait until element is visible    //input[@id='password']    timeout=120s
    input text  //input[@id='password']     She@1234
    click button    //*[@id="app"]/div/div/div/section/div[2]/section/form/div[4]/div/div/span/button

Login as recruiter on Prod
    wait until element is visible    //*[@id="emailId"]    timeout=120s
    input text   //*[@id="emailId"]     sharuhehe@gmail.com
    input text  //*[@id="password"]     She@1234
    click button    //*[@id="app"]/div/div/div/section/div[2]/section/form/div[4]/div/div/span/button
    BuiltIn.sleep   5s

Upload profile
    pyautogui.typewrite    ${IMAGE_FILE_PATH}
    Builtin.sleep   5s
    ImageHorizonLibrary.Press Combination   Key.enter
    BuiltIn.sleep    5s

Upload Resume
    pyautogui.typewrite    ${RESUME}
    BuiltIn.sleep    5s
    ImageHorizonLibrary.Press Combination   Key.enter
    BuiltIn.sleep    5s

Create Draft Event
    BuiltIn.sleep    3s
    set selenium speed    0.5s
    wait until page contains element    //div[3]/button[2]    timeout=120s
    click button    //div[3]/button[2]
    builtin.sleep    2s
    #Click button Add
    click button    //div[5]/button[1]
    input text    //input[@id='eventName']    Selenium Testing
    input text    //input[@id='eventLocation']    VIRTUAL
    input text    css=#eventDescription    Speciality - Robot Framework Expert
    click element    //span[1]/div[1]/input[1]
    click element    //tbody/tr[5]/td[5]/div[1]
    input text    //input[@id='openPositions']    10
    input text    //input[@id='eventAddress']    VIRTUAL
    input text    //input[@id='maxexperience']    10
    input text    //input[@id='maximumFootfall']    3
    input text    //input[@id='recepientEmailAddress']    saravjeet.singh@hotmail.com
    input text    //input[@id='forwardEmailAddress']    saravjeet.singh@hotmail.com
    input text    //textarea[@id='notesToPartners']    Test Automation Only
    #Save Draft
    click button    //span[1]/button[2]
    log to console    Draft Event Created Successfully.
    log    Draft Event Created Successfully.
    close all browsers

Submit Draft Event
    BuiltIn.sleep    3s
    set selenium speed    0.5s
    wait until page contains element    //div[3]/button[2]    timeout=120s
    click button    //div[3]/button[2]
    wait until page contains element    //tbody/tr[1]/td[6]/span[1]/span[2]/i[1]/*[1]    timeout=120s
    click element    //tbody/tr[1]/td[6]/span[1]/span[2]/i[1]/*[1]
    wait until page contains element    //div[16]/div[1]/div[1]/span[1]/button[1]    timeout=120s
    click element    //div[16]/div[1]/div[1]/span[1]/button[1]
    log to console    Draft Event Submitted Successfully.
    log    Draft Event Submitted Successfully.
    close all browsers

Approve Event
    builtin.sleep    3s
    wait until page contains element    //div[3]/button[2]    timeout=120s
    Click Button     //div[3]/button[2]
    BuiltIn.sleep    5s
    Click element   //span/i[@aria-label='icon: check-square-o']
    wait until page contains element    //div[1]/div[3]/button[1]    timeout=120s
    click element    //div[1]/div[3]/button[1]
    BuiltIn.sleep    5s
    log to console    Event Approved Successfully.
    log    Event Approved Successfully.
    close all browsers


Login as Admin in and add Company to grantee list
    open browser    ${Admin_url}    ${browser}
    maximize browser window
    input text    //*[@id="emailId"]     megha.nimbargimath@shenzyn.com
    input text  //*[@id="password"]     She@1234
    click button    //button[@class ='ant-btn btn-cta btn-block ant-btn-primary']
    builtin.sleep    2s
    click element    //*[@id="app-content"]/div/div/div/div/div[3]/div/div[2]/span
    builtin.sleep    3s
    #scroll down till end of the page.
    #execute javascript    window.scrollTo(0,document.body.scrollHeight)
    #click element    //li[@title='6']
    #log to console    page 6 pressed
    #builtin.sleep    2s
    #log to console    Click on assign company button.
    builtin.sleep    2s
    click element    //table/tbody/tr[1]/td[7]/span/i[5]
    builtin.sleep    2s
    mouse over    //button[@class='ant-btn ant-btn-primary ant-btn-sm']
    builtin.sleep    2s
    click button    //button[@class="ant-btn ant-btn-primary ant-btn-sm"]
    builtin.sleep    2s
    log to console    Issue started........
    click element    //div[@class='ant-select ant-select-enabled']
    #clear element text   //*[@id="assignedCompany"]
    input text    //input[@id='assignedCompany']    Phable Care
    log to console    going to press enter .....
    press keys    //input[@id='assignedCompany']    ENTER
    #click element
    log to console    enter pressed successfully ...
    #execute javascript   window.scrollTo(0,document.body.scrollHeight)
    #mouse over   //li[text()='Phable Care']
    builtin.sleep    5s
    click element   //input[@class="ant-calendar-picker-input ant-input"]
    #repeat keyword    3 times    Next Month
    click element   //div[contains(text(),'31')]
    click button    //button/span[text()='Assign']

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
    wait until element is visible    //div[contains(text(),'Recruiter not found')]    timeout=120s
    ${validate_text}=    get text    //div[contains(text(),'Recruiter not found')]
    should be equal    ${validate_text}     Recruiter not found
    log to console    ${\n}"Recruiter not found,Result as Expected"
    log    "Recruiter not found,Result as Expected"

Validate Negative Login 3
    wait until element is visible    //input[@id='emailId']    timeout=120s
    input text    //input[@id='emailId']    arun.i@shenzyn.com
    input text    //input[@id='password']    12345
    click button    //button
    click button    //button
    wait until element is visible    //div[contains(text(),'Username or password incorrect')]    timeout=120s
    ${validate_text}=    get text    //div[contains(text(),'Username or password incorrect')]
    should be equal    ${validate_text}     Username or password incorrect
    log to console    ${\n}"Username or password incorrect, Result as Expected"
    log    "Username or password incorrect, Result as Expected"

Validate Negative Login 4
    wait until element is visible    //input[@id='emailId']    timeout=120s
    #input text    //input[@id='emailId']
    input text    //input[@id='password']    12345
    click button    //button
    click button    //button
    wait until element is visible    //div[contains(text(),'Please input your username!')]    timeout=120s
    ${validate_text}=    get text    //div[contains(text(),'Please input your username!')]
    should be equal    ${validate_text}     Please input your username!
    log to console    ${\n}"Please input your username!, Result as Expected"
    log    "Please input your username!, Result as Expected"

Validate Negative Login 5
    wait until element is visible    //input[@id='emailId']    timeout=120s
    input text    //input[@id='emailId']    arun.i@shenzyn.com
    #input text    //input[@id='password']
    click button    //button
    click button    //button
    wait until element is visible    //div[contains(text(),'Please input your Password!')]    timeout=120s
    ${validate_text}=    get text    //div[contains(text(),'Please input your Password!')]
    should be equal    ${validate_text}     Please input your Password!
    log to console    ${\n}"Please input your Password!, Result as Expected"
    log    "Please input your Password!, Result as Expected"

Account Lock Testing
    wait until element is visible    //input[@id='emailId']    timeout=120s
    input text    //input[@id='emailId']    saravjeet.singh@hotmail.com
    input text    //input[@id='password']    1234
    click button    //button
    click button    //button
    wait until element is visible    //div[@class='ant-form-explain']    timeout=120s
    ${text}=    get text    //div[@class='ant-form-explain']
    log to console    ${\n}${text}
    should be equal    ${text}    Username or password incorrect
    log to console    ${\n}Username or password incorrect attempt successfull
    log    Username or password incorrect attempt successfull

Account Locked
    wait until element is visible    //input[@id='emailId']    timeout=120s
    input text    //input[@id='emailId']    saravjeet.singh@hotmail.com
    input text    //input[@id='password']    1234
    click button    //button
    click button    //button
    wait until element is visible    //div[@class='ant-form-explain']    timeout=120s
    ${text}=    get text    //div[@class='ant-form-explain']
    log to console    ${\n}${text}
    should be equal    ${text}    UnSuccessful Attempts, A password reset email has been sent
    log to console    ${\n}As Expected, Account locked after 5 wrong password attempts.
    log    As Expected, Account locked after 5 fail attempts.
