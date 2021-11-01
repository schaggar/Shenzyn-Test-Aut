*** Settings ***
Library    SeleniumLibrary

*** Variables ***

*** Keywords ***
Navigate to JobSearchMenu
    builtin.sleep    5s
    click element    //div[@class='ant-menu-submenu-title']//span//span[@class='nav-text'][contains(text(),'Jobs')]
    builtin.sleep    2s
    click element    //ul[1]/li[4]/ul[1]/li[2]/a[1]
    builtin.sleep    5s

Search By Skill
    wait until element is visible    //input[@id='search job']    timeout=120s
    clear element text    //input[@id='search job']
    input text    //input[@id='search job']    testing
    click element    //button[contains(text(),'Search')]
    wait until element is visible    //h4[contains(text(),'${JOB_NAME}')]    timeout=120s
    click element    //h4[contains(text(),'${JOB_NAME}')]
    wait until element is visible    //div[2]/button[2]    timeout=120s
    click element    //div[2]/button[2]

    #Validating toast messages if the job saved is successful. (Already Applied Job)
#    wait until element is visible    //span/div/div/div/span    timeout=120s
#    ${message}=    get text    //span/div/div/div/span
#    #Testing the text present on the toast message
#    should be equal    ${message}    Job already Saved
#    log to console    ${message}
#    log    ${message}

#    #Validating toast messages if the job saved is successful.
#    wait until element is visible    //span[contains(text(),'Job Saved SuccessFully !')]    timeout=120s
#    ${message}=    get text    //span[contains(text(),'Job Saved SuccessFully !')]
#    #Testing the text present on the toast message
#    should be equal    ${message}    Job Saved SuccessFully !
#    log to console    Job Saved SuccessFully!
#    log    Job Saved SuccessFully !
    builtin.sleep    2s

Apply Saved Job
    wait until element is visible    //*[@id="app-sidenav"]/div/div/ul/li[4]/div/span/span    timeout=120s
    click element    //*[@id="app-sidenav"]/div/div/ul/li[4]/div/span/span
    wait until element is visible    //div[1]/ul[1]/li[4]/ul[1]/li[1]/a[1]    timeout=120s
    click element    //div[1]/ul[1]/li[4]/ul[1]/li[1]/a[1]
    wait until element is visible    //h4[contains(text(),'QA Engineer')]    timeout=120s
    click element    (//h4[contains(text(),'QA Engineer')])[1]
    click element    (//button[@class='ant-btn ant-btn-default'])[1]

    #Validating toast messages
    wait until element is visible    //span[contains(text(),'Job already applied')]    timeout=120s
    ${message}=    get text    //span[contains(text(),'Job already applied')]
    #Testing the text present on the toast message
    should be equal    ${message}    Job already applied
    log to console    Job application successful. got message "Job already applied".
    log    Job application successful.

Apply Recommended Job
    builtin.sleep    5s
    click element    //*[@id="app-sidenav"]/div/div/ul/li[4]/div/span/span
    builtin.sleep    2s
    click element    //div[1]/div[1]/ul[1]/li[4]/ul[1]/li[3]/a[1]
    builtin.sleep    2s
    click element    //h4[contains(text(),${RECOMMENDED_JOB})]
    builtin.sleep    2s
    click element    //div[2]/div[2]/button[1]

Apply Events
    #Navigate to Events
    wait until element is visible    //div[1]/div[1]/ul[1]/li[5]/a[1]    timeout=120s
    click element    //div[1]/div[1]/ul[1]/li[5]/a[1]
    #Click View Details Link
    wait until element is visible    //li[1]/ul[1]/li[1]/a[1]    timeout=120s
    click element    //li[1]/ul[1]/li[1]/a[1]
    wait until element is visible    (//button[@class='ant-btn ant-btn-default'])[1]    timeout=120s
    click element    (//button[@class='ant-btn ant-btn-default'])[1]

    #Validating toast Messages
    wait until element is visible    //div/div/div/span
    ${message}=    get text    //div/div/div/span
    log to console    ${message}
    log    ${message}
#    run keyword if    ${message}  ==  Events Applied Successfully  FirstTimeEventAppl    ELSE    EventApplApplied
    #Events Applied Successfully
    #Profile Already Submitted By Partners/Recruiters

#FirstTimeEventAppl
#    log to console    ${message}
#
#EventApplApplied
#    log to console    ${message}

    #//span[contains(text(),'Failed to Apply Events')]
    #//span[contains(text(),'Profile Already Submitted By Partners/Recruiters')]

Select Mentor
    builtin.sleep    5s
    click element    //span[contains(text(),'Mentors')]
    builtin.sleep    2s
    click element    //div[1]/ul[1]/li[7]/ul[1]/li[1]/a[1]
    builtin.sleep    5s
    click element    //div[1]/div[1]/article[1]/div[3]/button[2]
    builtin.sleep    1s
    click element    //div[2]/div[1]/span[1]/div[1]/div[1]/div[1]
    builtin.sleep    1s
    click element    //li[@role='option']
    builtin.sleep    1s
#    click element    //div[2]/div[1]/div[1]/span[1]/button[1]

Jobseeker Registration Process
    #This is achived by the below temporary email address generator.
    #https://10minutemail.com/
    #Get a temp email ID.
    open browser    https://10minutemail.com/    ff
    #Copy email address
    wait until element is visible    //input[@id='mail_address']    timeout=120s
    ${temp_email}=    get text    //input[@id='mail_address']
    builtin.sleep    10s
    log to console    ${temp_email}
    close window

    #Fill Registration Page (Registration)
    open browser    http://js.stage.shenzyn.com/#/user/sign-up    ff
    wait until element is visible    //input[@id='name']    timeout=120s
    input text    //input[@id='name']    AutoTestUser
    input text    //input[@id='emailId']    ${temp_email}
    input text    //input[@id='password']    1234
    input text    //input[@id='password-confirm']   1234
    click element    //input[@id='signup-agreement']
    click element    //button

    #Validate Toast Message (Registration)
    #Validating toast messages
    wait until element is visible    //div[@class='ant-modal-confirm-content']    timeout=120s
    ${message}=    get text    //div[@class='ant-modal-confirm-content']
    log to console    ${\n}${message}

    #Testing the text present on the toast message
    should be equal    ${message}    Account Created Successfully, Please Check Your Inbox & Verify Your Mail!
    log to console    ${\n}Account Created Successfully, Please Check Your Inbox & Verify Your Mail!
    log    Account Created Successfully, Please Check Your Inbox & Verify Your Mail!

    #OK button
    click element    //button[@type='button']
    log to console    ${\n}Button clicked

Account Lock Testing
    wait until element is visible    //input[@id='emailId']    timeout=120s
    input text    //input[@id='emailId']    saravjeet.singh@hotmail.com
    input text    //input[@id='password']    1234
    click button    //button
    click button    //button
    wait until element is visible    //div[@class='ant-form-explain']    timeout=120s
    ${text}=    get text    //div[@class='ant-form-explain']
    log to console    ${\n}${text}
    should be equal    ${text}    Incorrect Password
    log to console    ${\n}Incorrect password attempt successfull
    log    Incorrect password attempt successfull

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

Account Locked (Reset Using Email)
    wait until element is visible    //input[@id='emailId']    timeout=120s
    input text    //input[@id='emailId']    saravjeet.singh@hotmail.com
    input text    //input[@id='password']    1234
    click button    //button
    click button    //button
    wait until element is visible    //div[@class='ant-form-explain']    timeout=120s
    ${text}=    get text    //div[@class='ant-form-explain']
    log to console    ${\n}${text}
    should be equal    ${text}    Multiple unsuccessful logins, please reset password with the link sent to your registerd E-mail
    log to console    ${\n}As Expected, message displayed as multiple unsuccessful logins.
    log    As Expected, message displayed as multiple unsuccessful logins.
