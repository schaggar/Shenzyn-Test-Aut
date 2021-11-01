*** Settings ***
Library  SeleniumLibrary
Library    ImapLibrary2
Library    re
Library    String

Documentation  Basic Login functionality
Resource  ../../Resources/PO/EmployerPO/CommonFunctionality.robot
Resource  ../../Resources/PO/EmployerPO/UserDefinedKeywords.robot
Resource  ../../Resources/employerApp.robot

Test Setup  CommonFunctionality.Start TestCase
Test Teardown  CommonFunctionality.Finish TestCase

*** Variables ***
#${BROWSER} =   firefox
#${STAR_URL} =   http://employer.stage.shenzyn.com/#/user/login
#${LOGIN_ID} =   arun.i@shenzyn.com
#${LOGIN_PASSWORD} =  1204ai!!
#Email Verification - password reset
#${url regexp}    http[s]?://(?:[a-zA-Z]|[0-9]|[$-_@.&+]|[!*\(\),]|(?:%[0-9a-fA-F][0-9a-fA-F]))+
${url regexp}    http[s]?://(?:[a-zA-Z#]|[0-9]|[$-_@.&+]|[!*\(\),\r\n]|(?:%[0-9a-fA-F][0-9a-fA-F]))+
${linkextact}    <a([^>]+)>(.+?)</a>
${EMAIL_VERIFICATION_TEXT} =    Email Verified Successfully.

*** Test Cases ***
TC1: Verify Employer Basic Login Funtionality
     [Documentation]  Employer Login
     #[Tags]  Login Functionality
     UserDefinedKeywords.Login

TC2: Validate Update profile
     [Documentation]  Employer Profile Update
     #[Tags]  Update Profile
     UserDefinedKeywords.Login
     UserDefinedKeywords.Update Profile

TC3: Reset Password
     [Documentation]  Employer Reset Password
     #[Tags]  Reset Password
     UserDefinedKeywords.Reset Password

TC4: Validate Add Recruiter
     [Documentation]  Employer Add Recruiter
     #[Tags]  Add Recruiter
     UserDefinedKeywords.Login
     UserDefinedKeywords.Add Recruiter

TC5: Reset Recruiter Password
     [Documentation]  Employer Reset Recruiter password
     #[Tags]  Reset Password
     UserDefinedKeywords.Reset Recruiter password

TC6: Validate Login as a Admin
     [Documentation]  Employer Admin Login
     #[Tags]  Admin Login
     UserDefinedKeywords.Login as Admin

TC7: Validate Search Profiles
     [Documentation]  Employer Search Profile
     #[Tags]  Search Profiles
     UserDefinedKeywords.Login as Admin
     UserDefinedKeywords.Search Profiles

TC8: Validate Post Job
     [Documentation]  Employer Post Job
     #[Tags]  Post Job
     UserDefinedKeywords.Login
     UserDefinedKeywords.Post a Job

TC9: Validate Job Approve
    [Documentation]  Employer Job Approve
    #[Tags]  Approve Job
    UserDefinedKeywords.Login
    UserDefinedKeywords.Approve Job

TC10: Create Draft Event
    [Documentation]  Create Draft Event
    #[Tags]  Draft Event
    UserDefinedKeywords.Login
    UserDefinedKeywords.Create Draft Event

TC11: Submit Draft Event
    [Documentation]  Submit Draft Event
    #[Tags]  Draft Event
    UserDefinedKeywords.Login
    UserDefinedKeywords.Submit Draft Event

TC11.1: Submit Event Temporary
    [Documentation]  Create Draft Event
    #[Tags]  Draft Event
    UserDefinedKeywords.LoginNonAdmin
    UserDefinedKeywords.Submit Event Temp

TC12: Validate Event Approve
    [Documentation]  Employer Approve Event
    #[Tags]  Approve Event
    UserDefinedKeywords.Login
    UserDefinedKeywords.Approve Event

#12-09-2021 *****************************************************************************
TC 13: Login (Incorrect email format)
    [Documentation]    This test will verify if the application is handling the negative tests
    employerApp.Negative Login 1

TC 14: Login (Employer not registered)
    [Documentation]    This test will verify if the application is handling the negative tests
    employerApp.Negative Login 2

TC 15: Login (Incorrect credentials)
    [Documentation]    This test will verify if the application is handling the negative tests
    employerApp.Negative Login 3

TC 16: Login (No email ID)
    #Defect - No error message is displayed, we'll switch on once the issues are fixed.
    [Documentation]    This test will verify if the application is handling the negative tests
    employerApp.Negative Login 4

TC 17: Login (No Password)
    #Defect - No error message is displayed,  we'll switch on once the issues are fixed.
    [Documentation]    This test will verify if the application is handling the negative tests
    employerApp.Negative Login 5

TC 18: Employer Password Reset
    [Documentation]    This test will verify if user is able to reset the password
    #[Tags]    Password Reset
    Go to   http://employer.stage.shenzyn.com/#/user/forgot-password
    MAXIMIZE BROWSER WINDOW
    wait until element is visible    //input[@id='emailId']    timeout=120s
    input text    //input[@id='emailId']    saravjeet.singh@hotmail.com    timeout=120
    #SEND RESET INSTRUCTIONS BUTTON
    click button    //button

    #Validating toast messages
    wait until element is visible    //div[@class='ant-modal-confirm-body']    timeout=120s
    ${message}=    get text    //div[@class='ant-modal-confirm-body']
    #Testing the text present on the toast message
    should be equal    ${message}    A password reset email has been sent, Check your mail!
    log to console    ${\n}A password reset email has been sent, Check your mail!
    log    A password reset email has been sent, Check your mail!

    #OK button
    click button    //button[@class='ant-btn ant-btn-primary']
    log to console    ${\n}wait for 10 seconds.
    BuiltIn.sleep    10s

TC 19: Employer Password Reset Email Verification (Manual Attempt)
    [Documentation]    This test will verify if user is receiving email for password reset
    [setup]    NONE
    #[Tags]    Password Reset Email Verification
    Open Mailbox    host=smtp.live.com    user=saravjeet.singh@hotmail.com    password=seerat@123
    ${LATEST} =    Wait For Email    sender=noreply@shenzyn.com    subject=Password Reset Token    folder=Inbox    timeout=300
    ${BODY} =    GET EMAIL BODY    ${LATEST}
#    should contain    ${BODY}    Hello, We have got a reset password request on your account.
    #should match regexp    ${BODY}    ${url regexp}
    ${test1}=    get regexp matches    ${BODY}    ${url regexp}
    log to console    ${\n}Original Reset URL:
    log to console    ${\n}${test1}[4]
    log    ${test1}[4]
    ${TrimmedUrl}=    remove string    ${test1}[4]    =
    log to console    ${\n}Trimmed Reset URL:
    log to console    ${\n}${TrimmedUrl}
    log    ${TrimmedUrl}
    log to console    ${\n}link verified, Result As Expected.
    open browser    ${TrimmedUrl}    ff

    input text    //input[@id='password']    s33rat@123
    input text    //input[@id='password-confirm']    s33rat@123
    click button    //button

    #Validating toast messages
    wait until element is visible    //div[@class='ant-modal-confirm-content']    timeout=120s
    ${message}=    get text    //div[@class='ant-modal-confirm-content']
    log to console    ${\n}${message}
    log    ${message}
    #Testing the text present on the toast message
    should be equal    ${message}    Your password is updated, please login using the email and password you just changed!
    log to console    ${\n}Your password is updated, please login using the email and password you just changed!
    log    Your password is updated, please login using the email and password you just changed!

    #OK button
    click element    //div[@class='ant-modal-confirm-btns']/button
    log to console    ${\n}Button clicked
    #comment    ${EMAIL_VERIFICATION_TEXT}
    #log to console    ${BODY}
#    @{LINKS}=    get links from email   ${LATEST}
#    log many    @{LINKS}
    #log to console    @{LINKS}
    Close Mailbox






#TC 20: Account Locked (Failure 1)
#    [Documentation]    Account Locked Attempt 1
#    partnerApp.account lock
#
##Reset 1
#TC 21: Account Locked (Failure 2)
#    [Documentation]    Account Locked Attempt 2
#    partnerApp.account lock
#
##Reset 2
#TC 22: Account Locked (Failure 3)
#    [Documentation]    Account Locked Attempt 3
#    partnerApp.account lock
#
##Reset 3
#TC 23: Account Locked (Failure 4)
#    [Documentation]    Account Locked Attempt 4
#    partnerApp.account lock
#
##Reset 4
#
#TC 24: Account Locked (Failure 5)
#    [Documentation]    Account Locked Attempt 5
#    partnerApp.account lock
#
##Reset 5
#TC 25: Account Locked (Failure 6)
#    [Documentation]    Account Locked Attempt 6
#    partnerApp.account lock
#
#TC 27: Account Locked (Failure 5)
#    [Documentation]    Account Locked Attempt 5
#    jobseekerapp.account locked final
#
#TC 28: Account Locked (Failure 6)
#    [Documentation]    Account Locked Attempt 6
#    jobseekerapp.account locked final
#
#TC 29: Locked Account Reset (Using Email)
#    [Documentation]    This test will reset the password for locked account
#    [setup]    NONE
#    #[Tags]    Password Reset Email Verification
#    Open Mailbox    host=smtp.live.com    user=saravjeet.singh@hotmail.com    password=seerat@123
#    ${LATEST} =    Wait For Email    sender=noreply@shenzyn.com    subject=Your account has been locked due to multiple invalid attempts.    folder=Inbox    timeout=300
#    ${BODY} =    GET EMAIL BODY    ${LATEST}
#    should contain    ${BODY}    Your account has been locked due to multiple invalid attempts.
#    #should match regexp    ${BODY}    ${url regexp}
#    ${test1}=    get regexp matches    ${BODY}    ${url regexp}
#    log to console    ${\n}${test1}[4]
#    ${TrimmedUrl}=    remove string    ${test1}[4]    =
#    log to console    ${\n}${TrimmedUrl}
#    log to console    ${\n}link verified, Result As Expected.
#    open browser    ${TrimmedUrl}    ff
#
#    input text    //input[@id='password']    s33rat@123
#    input text    //input[@id='password-confirm']    s33rat@123
#    click button    //button
#
#    #Validating toast messages
#    wait until element is visible    //div[@class='ant-modal-confirm-content']    timeout=120s
#    ${message}=    get text    //div[@class='ant-modal-confirm-content']
#    log to console    ${\n}${message}
#
#    #Testing the text present on the toast message
#    should be equal    ${message}    Your password is updated, please login using the email and password you just changed!
#    log to console    ${\n}Your password is updated, please login using the email and password you just changed!
#    log    Your password is updated, please login using the email and password you just changed!
#
#    #OK button
#    click element    //div[@class='ant-modal-confirm-btns']/button
#    log to console    ${\n}Button clicked
#    Close Mailbox
#
#TC 30: Validate Gender Detection (Male)
#    [Documentation]    This test will validate the error message thrown after uploading the male image to the js portal
#    #[Tags]    Update Profile
#    set selenium speed    1s
#    JobseekerApp.Login to jobseeker portal
#    JobseekerApp.Update Profile
#    JobseekerApp.Gender Detection (male)
#
#TC 31: Validate Gender Detection (Female)
#    [Documentation]    This test will validate the success message displayed after uploading the female image to the js portal
#    #[Tags]    Update Profile
#    set selenium speed    1s
#    JobseekerApp.Login to jobseeker portal
#    JobseekerApp.Update Profile
#    JobseekerApp.Gender Detection (female)
#
