*** Settings ***
Documentation    This test suite will contain the test cases related to jobseeker profile updation
Library    ImapLibrary2
Library    re
Library    String
Resource    ../../Resources/JobseekerApp.robot
Resource    ../../Resources/CommonApp.robot

Test Setup    CommonApp.Begin Web Test
Test Teardown    CommonApp.End Web Test

*** Variables ***
${BROWSER} =    headlessfirefox
#Chrome issue - ERROR:device_event_log_impl.cc(211)] [11:35:25.245] USB: usb_device_handle_win.cc:1020 Failed to read descriptor from node connection: A device attached to th
                #e system is not functioning. (0x1F)
${START_URL} =    http://js.stage.shenzyn.com/
${LOGIN_ID} =    saravjeet.singh@hotmail.com
${LOGIN_PASSWORD} =    s33rat@123
${BOTTOM_PAGELINK_LINKEDIN} =    https://www.linkedin.com/company/shenzyn/
${BOTTOM_PAGELINK_FACEBOOK} =    https://www.facebook.com/WeShenzyn/
${BOTTOM_PAGELINK_TWITTER} =    https://twitter.com/Shenzyn_EW
${BOTTOM_PAGELINK_INSTAGRAM} =    https://www.instagram.com/we_shenzyn/
${BOTTOM_PAGELINK_YOUTUBE} =    https://www.youtube.com/channel/UCJ3hSpePirYqXCAJo75OIhQ

#Personal Details
${USER_NAME} =    Saravjeet Chaggar
${EMAIL} =    saravjeet.singh@hotmail.com
${IMAGE_FILE_PATH} =    /var/opt/Shenzyn-apps/Shenzyn-Test-Aut/static/download.jpg
${IMAGE_FILE_PATH_MALE}=    /var/opt/Shenzyn-apps/Shenzyn-Test-Aut/static/male.jpg
${IMAGE_FILE_PATH_FEMALE}=    /var/opt/Shenzyn-apps/Shenzyn-Test-Aut/static/female.jpg
${RESUME} =    /var/opt/Shenzyn-apps/Shenzyn-Test-Aut/static/saravjeet.doc
${VIDEO_JD} =    /var/opt/Shenzyn-apps/Shenzyn-Test-Aut/static/big_buck_bunny_720p_1mb.mp4
${CURRENT_LOCATION} =    Pune, Maharashtra
${NATIONALITY} =    UK, British
${LINKEDIN} =    https://www.linkedin.com/in/schaggar
${GIT} =    https://github.com/schaggar
${CONTACT_NO} =    9975568427

#Educational Details
${DEGREE} =    BACHELOR OF ENGINEERING

${SPECIALIZATION} =    Computer Science
${INSTITUTE} =    SSCET

#Email Verification - password reset
#${url regexp}    http[s]?://(?:[a-zA-Z]|[0-9]|[$-_@.&+]|[!*\(\),]|(?:%[0-9a-fA-F][0-9a-fA-F]))+
${url regexp}    http[s]?://(?:[a-zA-Z#]|[0-9]|[$-_@.&+]|[!*\(\),\r\n]|(?:%[0-9a-fA-F][0-9a-fA-F]))+
${linkextact}    <a([^>]+)>(.+?)</a>
${EMAIL_VERIFICATION_TEXT} =    Email Verified Successfully.

${JOB_NAME} =    QA Engineer
${RECOMMENDED_JOB} =    'Software Engineer'


*** Test Cases ***
TC1: Validate Landing Page
    [Documentation]    This test will verify if the objects or links present and working on the jobseeker landing page
    #[Tags]    Validate Page Objects
    JobseekerApp.Verify Landing Page

TC2: Validate Login Functionality
    [Documentation]    This test will verify if the user is able to login to the Jobseeker portal
    #[Tags]    Login Functionality
    JobseekerApp.Login to jobseeker portal

TC3: Validate JobSeekerPage
    [Documentation]    This test will verify if all the objects are present on the jobseeker portal
    #[Tags]    Validate Page Objects
    JobseekerApp.Login to jobseeker portal
    JobseekerApp.Validate JSPageObjects

TC4.1: Validate Updates on Profile - Personal Details
    [Documentation]    This test will verify if the user is able to login and update the personal details on the jobseeker portal
    #[Tags]    Update Profile
    set selenium speed    1s
    JobseekerApp.Login to jobseeker portal
    JobseekerApp.Update Profile
    JobseekerApp.Update Personal Details

TC4.2: Validate Updates on Profile - Educational Details
    [Documentation]    This test will verify if the user is able to login and update the educational details on the jobseeker portal
    #[Tags]    Update Profile
    set selenium speed    0.5s
    JobseekerApp.Login to jobseeker portal
    JobseekerApp.Update Profile
    JobseekerApp.Update Educational Details

TC4.3: Validate Updates on Profile - Employment Details
    [Documentation]    This test will verify if the user is able to login and update the Employment details on the jobseeker portal
    #[Tags]    Update Profile
    set selenium speed    1s
    JobseekerApp.Login to jobseeker portal
    JobseekerApp.Update Profile
    JobseekerApp.Update Employment Details

TC4.4: Validate Updates on Profile - Project Details
    [Documentation]    This test will verify if the user is able to login and update the Project details on the jobseeker portal
    #[Tags]    Update Profile
    set selenium speed    0.5s
    JobseekerApp.Login to jobseeker portal
    JobseekerApp.Update Profile
    JobseekerApp.Update Project Details

TC4.5: Validate Updates on Profile - Skill Details
    [Documentation]    This test will verify if the user is able to login and update the Skill details on the jobseeker portal
    #[Tags]    Update Profile
    set selenium speed    0.5s
    JobseekerApp.Login to jobseeker portal
    JobseekerApp.Update Profile
    JobseekerApp.Update Skills

TC4.6: Validate Updates on Profile - Update Preference Details
    [Documentation]    This test will verify if the user is able to login and update the Update Preference details on the jobseeker portal
    #[Tags]    Update Profile
    set selenium speed    0.5s
    JobseekerApp.Login to jobseeker portal
    JobseekerApp.Update Profile
    JobseekerApp.Update Preferences

TC5: Search by Skill and Save job
    [Documentation]    This test will verify if user is able to search a job and apply
    #[Tags]    Search Jobs
    set selenium speed    0.5s
    JobseekerApp.Login to jobseeker portal
    JobseekerApp.Navigate to JobMenu
    JobseekerApp.SearchBy Skills

TC6: Apply Saved Job
    [Documentation]    This test will verify if user is able to apply the job
    #[Tags]    Apply Jobs
    JobseekerApp.Login to jobseeker portal
    JobseekerApp.Apply Saved Job

#TC7: Recommeded Job Application
#    [Documentation]    This test will verify if user is able the recommended jobs
#    #[Tags]    Apply Recommended Job
#    JobseekerApp.Login to jobseeker portal
#    JobseekerApp.Apply Recommended Job

#Include a test of employer to create an event in pune are so that it will be visible in js portal.

TC8: Apply for Events
    [Documentation]    This test will verify if user is able the recommended jobs
    #[Tags]    Apply Events
    seleniumlibrary.set selenium speed    0.5s
    JobseekerApp.Login to jobseeker portal
    JobseekerApp.Apply Events

TC9: Search and Select Mentor
    [Documentation]    This test will verify if user is select a mentor
    #[Tags]    Selecting a Mentor
    JobseekerApp.Login to jobseeker portal
    JobseekerApp.Mentor

TC 10: Jobseeker Password Reset
    [Documentation]    This test will verify if user is able to reset the password
    #[Tags]    Password Reset
    Go to   ${START_URL}#/user/forgot-password
    MAXIMIZE BROWSER WINDOW
    wait until element is visible    //input[@id='emailId']
    input text    //input[@id='emailId']    saravjeet.singh@hotmail.com
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

TC 12: Vaidated Saved Profile - Personal Details
    [Documentation]    This test will verify if the personal details filled in the update profile section are saved and captured correctly
    JobseekerApp.Login to jobseeker portal
    JobseekerApp.Validate Saved Personal Details

TC 13: Vaidated Saved Profile - Education
    [Documentation]    This test will verify if the educational details filled in the update profile section are saved and captured correctly
    JobseekerApp.Login to jobseeker portal
    JobseekerApp.Validate Saved Educational Details

TC 14: Vaidated Saved Profile - Employment
    [Documentation]    This test will verify if the employment details filled in the update profile section are saved and captured correctly
    JobseekerApp.Login to jobseeker portal
    JobseekerApp.Validate Saved Employment Details

TC 15: Vaidated Saved Profile - Projects
    [Documentation]    This test will verify if the project details filled in the update profile section are saved and captured correctly
    JobseekerApp.Login to jobseeker portal
    JobseekerApp.Validate Saved Project Details

#Skills to be added.*** Keywords ***

TC 16: Validated Saved Profile - Preferences
    [Documentation]    This test will verify if the Preferences details filled in the update profile section are saved and captured correctly
    JobseekerApp.Login to jobseeker portal
    JobseekerApp.Validate Saved Preferences

TC 17: Login (Incorrect email format)
    [Documentation]    This test will verify if the application is handling the negative tests
    JobseekerApp.Negative Login 1

TC 18: Login (User not registered)
    [Documentation]    This test will verify if the application is handling the negative tests
    JobseekerApp.Negative Login 2
#Commenting this temporarily, need to fix this ... this is failing in ubuntu machine
#TC 19: Password Reset Email Verification
#    [Documentation]    This test will verify if user is receiving email for password reset
#    [setup]    NONE
#    #[Tags]    Password Reset Email Verification
#    Open Mailbox    host=smtp.live.com    user=saravjeet.singh@hotmail.com    password=seerat@123
#    ${LATEST} =    Wait For Email    sender=noreply@shenzyn.com    subject=Password Reset Token    folder=Inbox    timeout=300
#    ${BODY} =    GET EMAIL BODY    ${LATEST}
#    should contain    ${BODY}    Your account has been locked due to multiple invalid attempts
#    #should match regexp    ${BODY}    ${url regexp}
#    ${test1}=    get regexp matches    ${BODY}    ${url regexp}
#    log to console    ${\n}Original Reset URL:
#    log to console    ${\n}${test1}[4]
#    log    ${test1}[4]
#    ${TrimmedUrl}=    remove string    ${test1}[4]    =
#    log to console    ${\n}Trimmed Reset URL:
#    log to console    ${\n}${TrimmedUrl}
#    log    ${TrimmedUrl}
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
#    log    ${message}
#    #Testing the text present on the toast message
#    should be equal    ${message}    Your password is updated, please login using the email and password you just changed!
#    log to console    ${\n}Your password is updated, please login using the email and password you just changed!
#    log    Your password is updated, please login using the email and password you just changed!
#
#    #OK button
#    click element    //div[@class='ant-modal-confirm-btns']/button
#    log to console    ${\n}Button clicked
#    #comment    ${EMAIL_VERIFICATION_TEXT}
#    #log to console    ${BODY}
##    @{LINKS}=    get links from email   ${LATEST}
##    log many    @{LINKS}
#    #log to console    @{LINKS}
#    Close Mailbox

TC 19: Login (Incorrect credentials)
    [Documentation]    This test will verify if the application is handling the negative tests
    JobseekerApp.Negative Login 3

TC 20: Login (No email ID)
    [Documentation]    This test will verify if the application is handling the negative tests
    JobseekerApp.Negative Login 4

TC 21: Login (No Password)
    [Documentation]    This test will verify if the application is handling the negative tests
    JobseekerApp.Negative Login 5

TC 23: Account Locked (Failure 1)
    [Documentation]    Account Locked Attempt 1
    jobseekerapp.account lock

TC 24: Account Locked (Failure 2)
    [Documentation]    Account Locked Attempt 2
    jobseekerapp.account lock

TC 25: Account Locked (Failure 3)
    [Documentation]    Account Locked Attempt 3
    jobseekerapp.account lock

TC 26: Account Locked (Failure 4)
    [Documentation]    Account Locked Attempt 4
    jobseekerapp.account locked (email sent)

TC 27: Account Locked (Failure 5)
    [Documentation]    Account Locked Attempt 5
    jobseekerapp.account locked final
#Commenting TC 28 and TC 29 temporarily as they are failing in ubuntu machine
#TC 28: Account Locked (Failure 6)
#    [Documentation]    Account Locked Attempt 6
#    jobseekerapp.account locked final
#
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
    open browser    ${TrimmedUrl}    headlessfirefox

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
