*** Settings ***
Library    SeleniumLibrary
Library    ImapLibrary2
Library    re
Library    String

Resource    ../../Resources/PO/HiringPartner_PO/CommonFunctionality.robot
Resource    ../../Resources/PO/HiringPartner_PO/UserDefinedkeywords.robot
Resource    ../../Sharanya/PartnerAddRecruiter.robot
Resource    ../../Sharanya/PartnerAdminSeeProfiles.robot
Resource    ../../Sharanya/PartnerEnrollEvent.robot
Resource    ../../Sharanya/PartnerLogin.robot
Resource    ../../Sharanya/PartnerShortlistjobs.robot
Resource    ../../Sharanya/PartnerSubscription.robot
Resource    ../../Sharanya/PartnerUploadProfile_Event.robot
Resource    ../../Sharanya/PartnerUploadProfile_Job.robot
Resource    ../../Sharanya/DeleteRecruiter.robot
Resource    ../../Sharanya/PasswordReset.robot
#Resource    ../Sharanya/Verifcation.robot
Resource    ../../Sharanya/Reports.robot
Resource    ../../Sharanya/PartnerUpload_Event_RE.robot
Resource    ../../Sharanya/PartnerUpload_Job_RE.robot
#Resource  ../Resources/PO/EmployerPO/UserDefinedKeywords.robot
Resource    ../../Resources/partnerApp.robot

Test Setup    CommonFunctionality.Start testcase
Test Teardown    CommonFunctionality.End testcase

*** Variables ***
#Email Verification - password reset
#${url regexp}    http[s]?://(?:[a-zA-Z]|[0-9]|[$-_@.&+]|[!*\(\),]|(?:%[0-9a-fA-F][0-9a-fA-F]))+
${url regexp}    http[s]?://(?:[a-zA-Z#]|[0-9]|[$-_@.&+]|[!*\(\),\r\n]|(?:%[0-9a-fA-F][0-9a-fA-F]))+
${linkextact}    <a([^>]+)>(.+?)</a>
${EMAIL_VERIFICATION_TEXT} =    Email Verified Successfully.

*** Test Cases ***
#TC1: Landing page
#    [Documentation]    Testcase to validate landing page
#    #[Tags]     Validate Page Objects
#    CommonFunctionality.Start testcase
#    CommonFunctionality.End testcase
TC 1.0: Partner Password Reset
    [Documentation]    This test will verify if user is able to reset the password
    #[Tags]    Password Reset
    Go to   ${url}#/user/forgot-password
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

TC 1.1: Partner Password Reset Email Verification (Manual Attempt)
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


TC2: Login Admin Account
    [Documentation]    Testcase to validate Login as Admin and Recruiter
    #[Tags]     Login Functionality
    #CommonFunctionality.Start testcase
    UserDefinedkeywords.Login as Admin
    PartnerLogin.Admin signout
    #CommonFunctionality.End testcase

TC2.1: Login Recruiter Account
    [Documentation]    Testcase to validate Login as Admin and Recruiter
    #[Tags]     Login Functionality
    #CommonFunctionality.Start testcase
    UserDefinedkeywords.Login as Recruiter
    PartnerLogin.Recruiter signout
    #CommonFunctionality.End testcase

TC3: Subscription
    [Documentation]    Testcase to verify Subscription
    #[Tags]     Verify Subscription
    #CommonFunctionality.Start testcase
    PartnerSubscription.Login details for sub
    PartnerSubscription.Subscription
    #CommonFunctionality.End testcase

TC4: Shortlist jobs
    [Documentation]    Testcase to check if user can Shortlist jobs
    #[Tags]     Verify Shortlisted Jobs
    #CommonFunctionality.Start testcase
    UserDefinedkeywords.Login as Admin
    PartnerShortlistjobs.Shortlist jobs
    #CommonFunctionality.End testcase

#Events should be created before applying them through partner portal, hence adding below 3 test cases from Employer here
#*********************************************************************************************
#TC10: Create Draft Event
#TC10 EMP: Create Draft Event
#    [Documentation]  Create Draft Event
#    #[Tags]  Draft Event
#    Open browser    http://employer.stage.shenzyn.com/    ${browser}
#    MAXIMIZE BROWSER WINDOW
#    wait until page contains element    //*[@id="emailId"]    timeout=180s
#    Input Text  //*[@id="emailId"]  arun.i@shenzyn.com
#    Input Password  //*[@id="password"]  1204ai!!
#    Click Button  //html/body/div/div/div/div/div/section/div[2]/section/form/div[4]/div/div/span/button
#    BuiltIn.sleep  2s
#    UserDefinedKeywords.Create Draft Event

#robot --timestampoutputs -d Results -N "Shenzyn Test Automation [Stage]" -t "TC10: Create Draft Event" Tests\stage
#TC11: Submit Draft Event
#TC11 EMP: Submit Draft Event
#    [Documentation]  Submit Draft Event
#    #[Tags]  Draft Event
#    Open browser    http://employer.stage.shenzyn.com/    ${browser}
#    MAXIMIZE BROWSER WINDOW
#    wait until page contains element    //*[@id="emailId"]    timeout=180s
#    Input Text  //*[@id="emailId"]  arun.i@shenzyn.com
#    Input Password  //*[@id="password"]  1204ai!!
#    Click Button  //html/body/div/div/div/div/div/section/div[2]/section/form/div[4]/div/div/span/button
#    BuiltIn.sleep  2s
#    UserDefinedKeywords.Submit Draft Event
#
##robot --timestampoutputs -d Results -N "Shenzyn Test Automation [Stage]" -t "TC11: Submit Draft Event" Tests\stage
##TC12: Validate Event Approve
#TC12 EMP: Validate Event Approve
#    [Documentation]  Employer Approve Event
#    #[Tags]  Approve Event
#    Open browser    http://employer.stage.shenzyn.com/    ${browser}
#    MAXIMIZE BROWSER WINDOW
#    wait until page contains element    //*[@id="emailId"]    timeout=180s
#    Input Text  //*[@id="emailId"]  arun.i@shenzyn.com
#    Input Password  //*[@id="password"]  1204ai!!
#    Click Button  //html/body/div/div/div/div/div/section/div[2]/section/form/div[4]/div/div/span/button
#    BuiltIn.sleep  2s
#    UserDefinedKeywords.Approve Event
#robot --timestampoutputs -d Results -N "Shenzyn Test Automation [Stage]" -t "TC12: Validate Event Approve" Tests\stage
#*********************************************************************************************
TC5: Enroll event
    [Documentation]    Testcase to check if user can Enroll for events as a admin
    #[Tags]     Verify Enrolled Event
    #CommonFunctionality.Start testcase
    UserDefinedkeywords.Login as Admin
    PartnerEnrollEvent.Enroll for an event
    #CommonFunctionality.End testcase

TC4:Add a Company to Grantee List
    [Documentation]    Testcase to add a company to grantee list
    #[Tags]    Verify the functionality to add a company to grantee list
    [setup]    None
    UserDefinedkeywords.Login as Admin in and add Company to grantee list


#Delete Recruiter
#    [Documentation]    Testcase to check if Admin can delete recruiter
#    #[Tags]     Test Case 06: Check if Admin delete recruiter
#    #CommonFunctionality.Start testcase
#    UserDefinedkeywords.Login as Admin
#    DeleteRecruiter.Delete recruiter
#    #CommonFunctionality.End testcase

TC6: UploadProfile for an event
    [Documentation]    Testcase to check if user can upload profile for an event
    #[Tags]     Check Uploaded Profile
    #CommonFunctionality.Start testcase
    UserDefinedkeywords.Login as Admin
    PartnerUploadProfile_Event.Upload profile for event
    #CommonFunctionality.End testcase

TC7: UploadProfile for an job
    [Documentation]    Testcase to check if user can upload profile for a Job
    #[Tags]     Check Uploaded Profile
    #CommonFunctionality.Start testcase
    UserDefinedkeywords.Login as Admin
    PartnerUploadProfile_Job.Upload profile for job
    #CommonFunctionality.End testcase

TC8: Admin See Profiles (Job)
    [Documentation]    Testcase to check if Admin can see the profiles submitted by the recruiter
    #[Tags]     Admin Rights
    #CommonFunctionality.Start testcase
    UserDefinedkeywords.Login as Admin
    PartnerAdminSeeProfiles.Check profiles submitted for a job
    #PartnerAdminSeeProfiles.Check profiles submitted for a event
    #CommonFunctionality.End testcase

TC8.1: Admin See Profiles (Event)
    [Documentation]    Testcase to check if Admin can see the profiles submitted by the recruiter
    #[Tags]     Admin Rights
    #CommonFunctionality.Start testcase
    UserDefinedkeywords.Login as Admin
    PartnerAdminSeeProfiles.Check profiles submitted for a event
    #CommonFunctionality.End testcase

TC9: Add recruiter
    [Documentation]    Testcase to check if Partner admin can add Recruiter
    #[Tags]     Add recruiter as Partner admin
    #CommonFunctionality.Start testcase
    UserDefinedkeywords.Login as Admin
    PartnerAddRecruiter.Add a recruiter
    #CommonFunctionality.End testcase

TC10: Password reset and email verfication when a recruiter is added
    [Documentation]    Testcase to verify if Recruiter receives the mail after been added by the ADMin
    #[Tags]    Password Reset Email Verification

    Open mailbox    host=smtp.live.com    user=Sharanya_test@hotmail.com    password=She@1234
    ${LATEST} =    Wait For Email    sender=noreply@shenzyn.com    subject=Password Reset Token    folder=Inbox    timeout=300
    ${BODY} =    GET EMAIL BODY    ${LATEST}
#    should contain    ${BODY}    Please Verify Your Account and Set Password By Clicking the Confirm Link Confirm
#    should match regexp    ${BODY}    ${url regexp}
    comment    ${EMAIL_VERIFICATION_TEXT}
    Close Mailbox

TC11: Password Reset
    [Documentation]    Testcase to check reset password
    #[Tags]     Password Reset Email Verification
    #CommonFunctionality.Start testcase
    PasswordReset.Password reset
    #CommonFunctionality.End testcase

    Open Mailbox    host=smtp.live.com    user=Sharanya_test@hotmail.com    password=She@1234
    ${LATEST} =    Wait For Email    sender=noreply@shenzyn.com    subject=Password Reset Token    folder=Inbox    timeout=300
    ${BODY} =    GET EMAIL BODY    ${LATEST}
#    should contain    ${BODY}    Hello, Your account has been locked due to multiple invalid attempts.Please reset your password by clicking the link here.
#    should match regexp    ${BODY}    ${url regexp}
    comment    ${EMAIL_VERIFICATION_TEXT}
    Close Mailbox

TC12: View reports as admin
    [Documentation]    Testcase to check if Partner admin can view reports
    #[Tags]     Partner admin
    #CommonFunctionality.Start testcase
    UserDefinedkeywords.Login as Admin
    Reports.View reports
    #CommonFunctionality.End testcase

TC13: Upload profile for event as recruiter
    [Documentation]    Testcase to check if Partner can Upload profile for event as recruiter
    #[Tags]     Verify Uploaded Profile
    #CommonFunctionality.Start testcase
    UserDefinedkeywords.Login as Recruiter
    PartnerUpload_Event_RE.Recruiter Upload profile for event
    #CommonFunctionality.End testcase

TC14: Upload profile for job as recruiter
    [Documentation]    Testcase to check if Partner can  Upload profile for job as recruiter
    #[Tags]     Verify Uploaded Profile
    #CommonFunctionality.Start testcase
    UserDefinedkeywords.Login as Admin
    PartnerUpload_Job_RE.Recruiter Upload profile for job
    #CommonFunctionality.End testcase

#12-09-2021 *****************************************************************************
TC 15: Login (Incorrect email format)
    [Documentation]    This test will verify if the application is handling the negative tests
    partnerApp.Negative Login 1

TC 16: Login (Recruiter not registered)
    [Documentation]    This test will verify if the application is handling the negative tests
    partnerApp.Negative Login 2

TC 17: Login (Incorrect credentials)
    [Documentation]    This test will verify if the application is handling the negative tests
    partnerApp.Negative Login 3

TC 18: Login (No email ID)
    [Documentation]    This test will verify if the application is handling the negative tests
    partnerApp.Negative Login 4

TC 19: Login (No Password)
    [Documentation]    This test will verify if the application is handling the negative tests
    partnerApp.Negative Login 5

TC 20: Account Locked (Failure 1)
    [Documentation]    Account Locked Attempt 1
    partnerApp.account lock

#Reset 1
TC 21: Account Locked (Failure 2)
    [Documentation]    Account Locked Attempt 2
    partnerApp.account lock

#Reset 2
TC 22: Account Locked (Failure 3)
    [Documentation]    Account Locked Attempt 3
    partnerApp.account lock

#Reset 3
TC 23: Account Locked (Failure 4)
    [Documentation]    Account Locked Attempt 4
    partnerApp.account lock

#Reset 4

TC 24: Account Locked (Failure 5)
    [Documentation]    Account Locked Attempt 5
    partnerApp.account lock

#Reset 5
TC 25: Account Locked (Failure 6)
    [Documentation]    Account Locked Attempt 6
    partnerApp.account lock

TC 27: Account Locked (Failure 5)
    [Documentation]    Account Locked Attempt 5
    jobseekerapp.account locked final

TC 28: Account Locked (Failure 6)
    [Documentation]    Account Locked Attempt 6
    jobseekerapp.account locked final

TC 29: Locked Account Reset (Using Email)
    [Documentation]    This test will reset the password for locked account
    [setup]    NONE
    #[Tags]    Password Reset Email Verification
    Open Mailbox    host=smtp.live.com    user=saravjeet.singh@hotmail.com    password=seerat@123
    ${LATEST} =    Wait For Email    sender=noreply@shenzyn.com    subject=Your account has been locked due to multiple invalid attempts.    folder=Inbox    timeout=300
    ${BODY} =    GET EMAIL BODY    ${LATEST}
    should contain    ${BODY}    Your account has been locked due to multiple invalid attempts.
    #should match regexp    ${BODY}    ${url regexp}
    ${test1}=    get regexp matches    ${BODY}    ${url regexp}
    log to console    ${\n}${test1}[4]
    ${TrimmedUrl}=    remove string    ${test1}[4]    =
    log to console    ${\n}${TrimmedUrl}
    log to console    ${\n}link verified, Result As Expected.
    open browser    ${TrimmedUrl}    ff

    input text    //input[@id='password']    s33rat@123
    input text    //input[@id='password-confirm']    s33rat@123
    click button    //button

    #Validating toast messages
    wait until element is visible    //div[@class='ant-modal-confirm-content']    timeout=120s
    ${message}=    get text    //div[@class='ant-modal-confirm-content']
    log to console    ${\n}${message}

    #Testing the text present on the toast message
    should be equal    ${message}    Your password is updated, please login using the email and password you just changed!
    log to console    ${\n}Your password is updated, please login using the email and password you just changed!
    log    Your password is updated, please login using the email and password you just changed!

    #OK button
    click element    //div[@class='ant-modal-confirm-btns']/button
    log to console    ${\n}Button clicked
    Close Mailbox

TC 30: Validate Gender Detection (Male)
    [Documentation]    This test will validate the error message thrown after uploading the male image to the js portal
    #[Tags]    Update Profile
    set selenium speed    1s
    JobseekerApp.Login to jobseeker portal
    JobseekerApp.Update Profile
    JobseekerApp.Gender Detection (male)

TC 31: Validate Gender Detection (Female)
    [Documentation]    This test will validate the success message displayed after uploading the female image to the js portal
    #[Tags]    Update Profile
    set selenium speed    1s
    JobseekerApp.Login to jobseeker portal
    JobseekerApp.Update Profile
    JobseekerApp.Gender Detection (female)

