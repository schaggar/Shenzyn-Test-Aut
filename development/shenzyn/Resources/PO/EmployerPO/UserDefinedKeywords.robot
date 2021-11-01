*** Settings ***
Library  SeleniumLibrary    timeout=120s
#Library  ImageHorizonLibrary

*** Variables ***
${IMAGE_FILE_PATH}   C:\\gitclonenew\\Shenzyn-Test-Aut\\static\\download.jpg
${Resume}      C:\\gitclonenew\\Shenzyn-Test-Aut\\static\\saravjeet.doc
${Video_JD}   C:\\gitclonenew\\Shenzyn-Test-Aut\\static\\big_buck_bunny_720p_1mb.mp4

*** Keywords ***
Login
    wait until page contains element    //*[@id="emailId"]    timeout=180s
    Input Text  //*[@id="emailId"]  arun.i@shenzyn.com
    Input Password  //*[@id="password"]  1204ai!!
    Click Button  //html/body/div/div/div/div/div/section/div[2]/section/form/div[4]/div/div/span/button
    BuiltIn.sleep  2s

LoginNonAdmin
    wait until page contains element    //*[@id="emailId"]    timeout=180s
    Input Text  //*[@id="emailId"]  saravjeet.singh@hotmail.com
    Input Password  //*[@id="password"]  s33rat@123
    Click Button  //html/body/div/div/div/div/div/section/div[2]/section/form/div[4]/div/div/span/button
    BuiltIn.sleep  2s


Update Profile
  # Basic Detailes
    set selenium speed  0.5s
    #Edit Profile Button
    wait until element is visible    //h4[1]/button[@class='ant-btn ant-btn-icon-only']    timeout=120s
    Click Button  //h4[1]/button[@class='ant-btn ant-btn-icon-only']
    #wait until element is visible    //div[1]/span[1]/input[@type='file']    timeout=120s
    wait until element is visible    //label[contains(text(),'Logo')]
    choose file    //div[1]/span[1]/input[@type='file']    ${IMAGE_FILE_PATH}
    #choose file    css=#logo    ${IMAGE_FILE_PATH}
    #pyautogui.typewrite
    #BuiltIn.sleep  2s
    #ImageHorizonLibrary.Press Combination   Key.enter
    #BuiltIn.sleep  3s

    #Validating toast messages
    wait until element is visible    //span[contains(text(),'Logo uploaded successfully....')]    timeout=120s
    ${message}=    get text    //span[contains(text(),'Logo uploaded successfully....')]
    #Testing the text present on the toast message
    should be equal    ${message}    Logo uploaded successfully....

    builtin.log to console    Image upload toast successful.

    Input Text  //*[@id="industry"]    Information Technology
    Input Text  //*[@id="website"]    www.shenzyn.com
    Input Text  (//div[1]/input[1])[1]  +91
    Input Text  //*[@id="contactno"]  8861452547
    Input Text  //*[@id="address"]  1172, J P Nagar, 1st Cross.
    BuiltIn.sleep  2s
    input text  //*[@id="location"]/div/div/ul/li/div/input     Bangalore Rural, Karnataka
#    ImageHorizonLibrary.Press Combination   Key.enter
    Input Text  //*[@id="pincode"]  586100
    Input Text  //*[@id="gstin"]  18AABCT3518Q1ZV
    Input Text  //*[@id="sachsn"]  1100
    Click Button  //div[4]/button
    BuiltIn.sleep  3s

    #Validating toast messages
    wait until element is visible    //span[contains(text(),'Succesfully saved company details.')]    timeout=120s
    ${message}=    get text    //span[contains(text(),'Succesfully saved company details.')]
    #Testing the text present on the toast message
    should be equal    ${message}    Succesfully saved company details.

    builtin.log to console    Page 1 submission successful.

  # Advanced Detailes
    wait until element is visible    //textarea[@id='aboutus']    timeout=120s
    Input Text  //textarea[@id='aboutus']  xyz
    Input Text  //textarea[@id='culture']    abcd
    Input Text  //*[@id="es"]  150
    Input Text  //*[@id="gd"]  30%
    clear element text    (//span[1]/input[1])[2]
    wait until element is visible    (//span[1]/input[1])[2]    timeout=120s
    Input Text  (//span[1]/input[1])[2]    Unlimited Medical leaves
    Input Text  (//span[1]/input[1])[3]    Free Cab Service
    Click Button  //div[4]/button[2]
    BuiltIn.sleep  5s

    #Validating toast messages
    #wait until element is visible    //span[contains(text(),'Succesfully saved company details.')]    timeout=120s
    #${message}=    get text    //span[contains(text(),'Succesfully saved company details.')]
    #Testing the text present on the toast message
    #should be equal    ${message}    Succesfully saved company details.
    #handle alert    action=ACCEPT    timeout=120s
    builtin.log to console    Page 2 submission successful
    #click button

Reset Password
    Click Link  //*[@id="app"]/div/div/div/section/div[2]/section/p[2]/a
    BuiltIn.sleep  2s
    Input Text  //*[@id="emailId"]  megha.nimbargimath@shenzyn.com
    BuiltIn.sleep  2s
    Click Button  //*[@id="app"]/div/div/div/section/div[2]/section/form/div[2]/div/div/span/button
    BuiltIn.sleep  3s

Add Recruiter
    #Button Recruiters
    seleniumlibrary.set selenium speed    0.25
    wait until element is visible    //div[3]/button[3]    timeout=120s
    Click Button  //div[3]/button[3]
    #Button Add
    wait until element is visible    //div[2]/button    timeout=120s
    Click Button  //div[2]/button
    #Click Element   //html/body/div[2]/div/div[2]/div/div[2]/div/section/form/div[1]/div[2]/div/span/span/div/span
    #BuiltIn.sleep  3s
    #pyautogui.typewrite    ${IMAGE_FILE_PATH}
    wait until element is visible    //div[2]/div/span/span/div/span    timeout=120s
    choose file    //input[@type='file']     ${IMAGE_FILE_PATH}
    #ImageHorizonLibrary.Press Combination   Key.enter
    #press key    NONE    \ue007
    wait until element is visible    //*[@id="name"]    timeout=120s
    Input Text  //*[@id="name"]  Megha
    Input Text  //*[@id="mail"]  mnimbargimath@gmail.com
    click element    (//ul/li/div[@class='ant-select-search__field__wrap'])[2]
    click element    //li[contains(text(),'India-(+91)')]
    Input Text  //*[@id="contactno"]  8861452547
    Input Text  //*[@id="address"]  501,HSR Layout,1st phase.
    Input Text  //*[@id="linkedin"]  https://www.linkedin.com/in/megha-nimbargimath-63a119152/
    Input Text  //*[@id="location"]  Banglore
    Click Button  //div/div/span/button

    #Validating toast messages
    wait until element is visible    //span[contains(text(),'Email-Id already registered')]    timeout=120s
    ${message}=    get text    //span[contains(text(),'Email-Id already registered')]
    #Testing the text present on the toast message
    should be equal    ${message}    Email-Id already registered
    #handle alert    action=ACCEPT    timeout=120s
    log to console    Email-Id already registered

Reset recruiter password
    Click Link  //*[@id="app"]/div/div/div/section/div[2]/section/p[2]/a
    BuiltIn.sleep  2s
    Input Text  //*[@id="emailId"]  megha.nimbargimath@shenzyn.com
    BuiltIn.sleep  2s
    Click Button  //*[@id="app"]/div/div/div/section/div[2]/section/form/div[2]/div/div/span/button
    BuiltIn.sleep  3s

Login as Admin
    Input Text  //*[@id="emailId"]  arun.i@shenzyn.com
    BuiltIn.sleep  3s
    Input Password  //*[@id="password"]  1204ai!!
    BuiltIn.sleep  3s
    Click Button  //html/body/div/div/div/div/div/section/div[2]/section/form/div[4]/div/div/span/button
    BuiltIn.sleep  5s

Search Profiles
    Input Text  xpath=/html/body/div/div/div/section/section/div/header/div/div[2]/li/div/span/input  Java
    BuiltIn.sleep  3s
    Input Text  xpath=/html/body/div/div/div/section/section/div/header/div/div[2]/li/div/span/div/div/div/ul/li/div/input  Banglore
    BuiltIn.sleep  3s
    Click Button  xpath=/html/body/div/div/div/section/section/div/header/div/div[2]/li/div/span/button
    BuiltIn.sleep  5s

Post a Job
    #Job Detailes
    log to console    ${\n}Enter Job Details loaded
    set selenium speed  0.25s
    wait until page contains element    //div[3]/button[1]    timeout=120s
    #Button -> post a job
    Click Button  //div[3]/button[1]
    wait until element is visible    (//button)[3]    timeout=120s
    #Video JD upload Input
    seleniumlibrary.choose file    //input[@type='file']    ${Video_JD}

    log to console    Validating toast message "Job Details".
    #Validating toast messages
    wait until element is visible    //span[contains(text(),'JD Video uploaded successfully.')]    timeout=120s
    ${message}=    get text    //span[contains(text(),'JD Video uploaded successfully.')]
    #Testing the text present on the toast message
    should be equal    ${message}    JD Video uploaded successfully.
    log to console    ${message}
    log    ${message}

    wait until element is visible    //input[@id='jobtitle']    timeout=120s
    Input Text    //input[@id='jobtitle']    QA Engineer
    #Job Description
    Input Text    //div[3]/div[2]/div/span/div/div[2]/div/div[1]   The person should be proficient in Manual and Automation Testing.
    Input Text  //*[@id="positions"]   20
    Input Text  //*[@id="minsalary"]  4
    Input Text  //*[@id="maxsalary"]  6
#    Select Checkbox  //*[@id="hidesalary"]
    Input Text    //*[@id="otherbenefits"]    Free Cab Service
    input text  //*[@id="joblocation"]/div/div/ul/li/div/input     Pune, Maharashtra
#    ImageHorizonLibrary.Press Combination    Key.enter
    wait until element is visible    //button[@class='ant-btn ant-btn-primary']    timeout=120s
    Click Button  //button[@class='ant-btn ant-btn-primary']

    log to console    Validating toast message "Job Details".
    #Validating toast messages
    wait until element is visible    //span[contains(text(),'Succesfully saved job details.')]    timeout=120s
    ${message}=    get text    //span[contains(text(),'Succesfully saved job details.')]
    #Testing the text present on the toast message
    should be equal    ${message}    Succesfully saved job details.
    #click button    //button[@class='ant-btn ant-btn-primary']
    log to console    ${message}
    log    ${message}

    #Candidate Detailes
    log to console    Candidate Details Loaded
    wait until element is visible    //*[@id="minexp"]    120s
    Input Text  //*[@id="minexp"]  2
    Input Text  //*[@id="maxexp"]  5
    Input Text  //*[@id="functionalArea"]/div/div/ul/li/div/input  Engineering
    wait until element is visible    //div[@id='functionalArea']    timeout=120s
    click element    //div[@id='functionalArea']
    wait until element is visible    //li[contains(text(),'Engineering')]
    click element    //li[contains(text(),'Engineering')]
    clear element text    //input[@id='skillsUtilized']
    input text    //input[@id='skillsUtilized']    Testing New
    builtin.sleep    2s
    clear element text    //input[@id='languagesKnown']
    input text    //input[@id='languagesKnown']    English New
    builtin.sleep    2s
    Input Text  //*[@id="np"]  45

    wait until element is visible    //button[@class='ant-btn ant-btn-primary']    timeout=60s
    #wait until page contains    //button[@class='ant-btn ant-btn-primary']    timeout=120s
    wait until element is enabled    //button[@class='ant-btn ant-btn-primary']    timeout=60s
    #wait until location contains    //button[@class='ant-btn ant-btn-primary']    timeout=60s
    click button    (//button)[4]

    log to console    Validating toast message "Candidate Details".
    #Validating toast messages
    wait until element is visible    //span[contains(text(),'Succesfully saved candidate details.')]    timeout=120s
    ${message}=    get text    //span[contains(text(),'Succesfully saved candidate details.')]
    #Testing the text present on the toast message
    should be equal    ${message}    Succesfully saved candidate details.
    log to console    ${message}
    log    ${message}

    #Education Details
    log to console    Education Details Loaded
    wait until element is visible    //div[@id='qualification']    timeout=120s
    click element    //div[@id='qualification']
    wait until element is visible    //li[contains(text(),'Post Graduation')]    timeout=120s
    click element    //li[contains(text(),'Post Graduation')]
    clear element text    //input[@id='degree']
    input text    //input[@id='degree']    M.B.A
    builtin.sleep    1s
    clear element text    //input[@id='specialization']
    input text    //input[@id='specialization']    Computers
    wait until element is visible    //button[@class='ant-btn ant-btn-primary']
    click element    //button[@class='ant-btn ant-btn-primary']

    log to console    Validating toast message "Candidate Details".
    #Validating toast messages
    wait until element is visible    //span[contains(text(),'Succesfully saved educational details.')]    timeout=120s
    ${message}=    get text    //span[contains(text(),'Succesfully saved educational details.')]
    #Testing the text present on the toast message
    should be equal    ${message}    Succesfully saved educational details.
    log to console    ${message}
    log    ${message}

    #Manage Response
    log to console    Manage Response
    wait until element is visible    //input[@class='ant-input']    timeout=120s
    log to console    Manage Response - Element Found
    Input Text    css=#recipient    mnimbargimath@gmail.com
    log to console    Manage Response - Email 1 Found
    Input Text    css=#forward    megha.nimbargimath@shenzyn.com
    log to console    Manage Response - Email 2 Found
    Click Button  //button[@class='ant-btn ant-btn-primary']

   #Validating toast messages
    wait until element is visible    //span[contains(text(),'Job Saved Succesfully')]    timeout=120s
    ${message}=    get text    //span[contains(text(),'Job Saved Succesfully')]
    #Testing the text present on the toast message
    should be equal    ${message}    Job Saved Succesfully
    #click button    //button[@class='ant-btn ant-btn-primary']
    log to console    Job posted Successfully
    log    Job posted Successfully

Approve Event
    builtin.sleep    3s
    wait until page contains element    //div[3]/button[2]    timeout=120s
    Click Button     //div[3]/button[2]
    BuiltIn.sleep    5s
    Click element   //span/i[@aria-label='icon: check-square-o']
    wait until page contains element    //div[1]/div[3]/button[1]    timeout=120s
    click element    //div[1]/div[3]/button[1]
    BuiltIn.sleep    5s

Approve Job
    wait until page contains element    //tbody/tr[1]/td[6]/span[1]/span[2]/i[1]/*[1]    timeout=120s
    Click element  //tbody/tr[1]/td[6]/span[1]/span[2]/i[1]/*[1]

    wait until element is visible    //div[5]/button[1]    timeout=120s
    #Next
    click element    //div[5]/button[1]
    builtin.log to console    Test 1 Succeded

    #Next
    wait until element is visible    //div[5]/button[1]    timeout=60s
    click element    //div[5]/button[1]
    builtin.log to console    Test 2 Succeded
#    builtin.sleep    2s
    #Next
    Wait until element is visible    //div[5]/button[1]    timeout=120s
    click element    //div[5]/button[1]
    builtin.log to console    Test 3 Succeded
    builtin.sleep    10s
#    click element    //div[5]/button[2]
#    wait until element is visible    //input[@id='recipient']    timeout=120s
#    clear element text    //input[@id='recipient']
#    input text    //input[@id='recipient']    writeback@mycompay.com
#
#    clear element text    //input[@id='forward']
#    input text    //input[@id='forward']    writeback@mycompay.com
#    #Approve
#    wait until element is visible    //div[5]/button[2]    timeout=120s
#    click element    //div[5]/button[2]
#    BuiltIn.sleep  2s

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
    #Calendar
    click element    //span[1]/div[1]/input[1]
    #Select Date
    click element    //div[contains(text(),'31')]
    #click element    //tbody/tr[5]/td[5]/div[1]
    input text    //input[@id='openPositions']    10
    input text    //input[@id='eventAddress']    VIRTUAL
    input text    //input[@id='maxexperience']    10
    input text    //input[@id='maximumFootfall']    3
    input text    //input[@id='recepientEmailAddress']    saravjeet.singh@hotmail.com
    input text    //input[@id='forwardEmailAddress']    saravjeet.singh@hotmail.com
    input text    //textarea[@id='notesToPartners']    Test Automation Only
    #Save Draft
    click button    //span[1]/button[2]

Submit Draft Event
    BuiltIn.sleep    3s
    set selenium speed    0.5s
    wait until page contains element    //div[3]/button[2]    timeout=120s
    click button    //div[3]/button[2]
    wait until page contains element    //tbody/tr[1]/td[6]/span[1]/span[2]/i[1]/*[1]    timeout=120s
    click element    //tbody/tr[1]/td[6]/span[1]/span[2]/i[1]/*[1]
    wait until page contains element    //div[17]/div[1]/div[1]/span[1]/button[1]    timeout=120s
    click element    //div[17]/div[1]/div[1]/span[1]/button[1]

Submit Event Temp
    BuiltIn.sleep    3s
    set selenium speed    0.5s
    wait until page contains element    //div[3]/button[2]    timeout=120s
    click button    //div[3]/button[2]
    builtin.sleep    2s
    #Click button Add
    click button    //div[5]/button[1]
    input text    //input[@id='eventName']    Selenium Testing
    input text    //input[@id='eventLocation']    Pune, Maharashtra
    input text    css=#eventDescription    Speciality - Robot Framework Expert
    #Calendar
    click element    //span[1]/div[1]/input[1]
    #Date Select
    click element    //div[contains(text(),'31')]
    input text    //input[@id='openPositions']    10
    input text    //input[@id='eventAddress']    Pune, Maharashtra
    input text    //input[@id='maxexperience']    10
    input text    //input[@id='maximumFootfall']    3
    input text    //input[@id='recepientEmailAddress']    saravjeet.singh@hotmail.com
    input text    //input[@id='forwardEmailAddress']    saravjeet.singh@hotmail.com
    input text    //textarea[@id='notesToPartners']    Test Automation Only
    #Submit Event
    wait until element is visible     //div[17]/div[1]/div[1]/span[1]/button[1]    timeout=120s
    click button    //div[17]/div[1]/div[1]/span[1]/button[1]

    #Validating toast messages
    wait until element is visible    //span[contains(text(),'Event posted successfully')]    timeout=120s
    ${message}=    get text    //span[contains(text(),'Event posted successfully')]
    #Testing the text present on the toast message
    should be equal    ${message}    Event posted successfully
    #click button    //button[@class='ant-btn ant-btn-primary']
    log to console    ${\n}Event posted successfully
    log    Event posted successfully

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
    wait until element is visible    //div[contains(text(),'No account found with the username')]    timeout=120s
    ${validate_text}=    get text    //div[contains(text(),'No account found with the username')]
    should be equal    ${validate_text}     No account found with the username
    log to console    ${\n}"No account found with the username, Result as Expected"
    log    "No account found with the username, Result as Expected"

Validate Negative Login 3
    wait until element is visible    //input[@id='emailId']    timeout=120s
    input text    //input[@id='emailId']    arun.i@shenzyn.com
    input text    //input[@id='password']    12345
    click button    //button
    click button    //button
    wait until element is visible    //div[contains(text(),'Wrong password')]    timeout=120s
    ${validate_text}=    get text    //div[contains(text(),'Wrong password')]
    should be equal    ${validate_text}     Wrong password
    log to console    ${\n}"Wrong password, Result as Expected"
    log    "Wrong password, Result as Expected"

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
