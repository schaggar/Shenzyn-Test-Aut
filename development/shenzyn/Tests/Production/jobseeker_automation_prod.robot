*** Settings ***
Documentation    This test suite will contain the test cases related to jobseeker profile updation
Library    ImapLibrary2
Library    re
Resource    ../../Resources/JobseekerApp.robot
Resource    ../../Resources/CommonApp.robot

Test Setup    CommonApp.Begin Web Test
Test Teardown    CommonApp.End Web Test

*** Variables ***
${BROWSER} =    firefox
#Chrome issue - ERROR:device_event_log_impl.cc(211)] [11:35:25.245] USB: usb_device_handle_win.cc:1020 Failed to read descriptor from node connection: A device attached to th
                #e system is not functioning. (0x1F)
${START_URL} =    https://jobs.shenzyn.com/#/user/login
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
${IMAGE_FILE_PATH} =    C:\\gitclonenew\\Shenzyn-Test-Aut\\static\\download.jpg
${RESUME} =    C:\\gitclonenew\\Shenzyn-Test-Aut\\static\\saravjeet.doc
${VIDEO_JD} =    C:\\gitclonenew\\Shenzyn-Test-Aut\\static\\big_buck_bunny_720p_1mb.mp4
${CURRENT_LOCATION} =    Dibang Valley, Arunachal Pradesh
${NATIONALITY} =    UK, British
${LINKEDIN} =    https://www.linkedin.com/in/schaggar
${GIT} =    https://github.com/schaggar
${CONTACT_NO} =    9975568427

#Educational Details
${DEGREE} =    Computer Science

${SPECIALIZATION} =    Computer Science
${INSTITUTE} =    SSCET

#Email Verification - password reset
${url regexp}    http[s]?://(?:[a-zA-Z]|[0-9]|[$-_@.&+]|[!*\(\),]|(?:%[0-9a-fA-F][0-9a-fA-F]))+
${EMAIL_VERIFICATION_TEXT} =    Email Verified Successfully.

${JOB_NAME} =    Automation Tester
${RECOMMENDED_JOB} =    'Quality Assure'

*** Test Cases ***
TC1: Validate Landing Page
    [Documentation]    This test will verify if the objects or links present and working on the jobseeker landing page
    [Tags]    01 Test Case: Validate JS Landing Page
    JobseekerApp.Verify Landing Page

TC2: Validate Login Functionality
    [Documentation]    This test will verify if the user is able to login to the Jobseeker portal
    [Tags]    02 Test Case: Validate JS Login Funcationality
    JobseekerApp.Login to jobseeker portal

TC3: Validate JobSeekerPage
    [Documentation]    This test will verify if all the objects are present on the jobseeker portal
    [Tags]    03 Test Case: Validate JS Page Objects
    JobseekerApp.Login to jobseeker portal
    JobseekerApp.Validate JSPageObjects

TC4.1: Validate Updates on Profile - Personal Details
    [Documentation]    This test will verify if the user is able to login and update the personal details on the jobseeker portal
    [Tags]    04.1 Test Case: Validate Personal Details Update Functionality
    set selenium speed    1s
    JobseekerApp.Login to jobseeker portal
    JobseekerApp.Update Profile
    JobseekerApp.Update Personal Details

TC4.2: Validate Updates on Profile - Educational Details
    [Documentation]    This test will verify if the user is able to login and update the educational details on the jobseeker portal
    [Tags]    04.2 Test Case: Validate Educational Details Update Functionality
    set selenium speed    0.5s
    JobseekerApp.Login to jobseeker portal
    JobseekerApp.Update Profile
    JobseekerApp.Update Educational Details

TC4.3: Validate Updates on Profile - Employment Details
    [Documentation]    This test will verify if the user is able to login and update the Employment details on the jobseeker portal
    [Tags]    04.3 Test Case: Validate Employment Details Update Functionality
    set selenium speed    1s
    JobseekerApp.Login to jobseeker portal
    JobseekerApp.Update Profile
    JobseekerApp.Update Employment Details

TC4.4: Validate Updates on Profile - Project Details
    [Documentation]    This test will verify if the user is able to login and update the Project details on the jobseeker portal
    [Tags]    04.4 Test Case: Validate Project Details Update Functionality
    set selenium speed    0.5s
    JobseekerApp.Login to jobseeker portal
    JobseekerApp.Update Profile
    JobseekerApp.Update Project Details

TC4.5: Validate Updates on Profile - Skill Details
    [Documentation]    This test will verify if the user is able to login and update the Skill details on the jobseeker portal
    [Tags]    04.5 Test Case: Validate Skill Details Update Functionality
    set selenium speed    0.5s
    JobseekerApp.Login to jobseeker portal
    JobseekerApp.Update Profile
    JobseekerApp.Update Skills

TC4.6: Validate Updates on Profile - Update Preference Details
    [Documentation]    This test will verify if the user is able to login and update the Update Preference details on the jobseeker portal
    [Tags]    04.6 Test Case: Validate Update Preference Details Update Functionality
    set selenium speed    0.5s
    JobseekerApp.Login to jobseeker portal
    JobseekerApp.Update Profile
    JobseekerApp.Update Preferences

TC5: Search by Skill and Save job
    [Documentation]    This test will verify if user is able to search a job and apply
    [Tags]    05 Test Case: Validate job search by Skills
    set selenium speed    0.5s
    JobseekerApp.Login to jobseeker portal
    JobseekerApp.Navigate to JobMenu
    JobseekerApp.SearchBy Skills

TC6: Apply Saved Job
    [Documentation]    This test will verify if user is able to apply the job
    [Tags]    06 Test Case: Apply saved job
    JobseekerApp.Login to jobseeker portal
    JobseekerApp.Apply Saved Job

TC7: Recommeded Job Application
    [Documentation]    This test will verify if user is able the recommended jobs
    [Tags]    07 Test Case: Apply Recommended job
    JobseekerApp.Login to jobseeker portal
    JobseekerApp.Apply Recommended Job
TC8: Apply for Events
    [Documentation]    This test will verify if user is able the recommended jobs
    [Tags]    08 Test Case: Apply Events
    seleniumlibrary.set selenium speed    0.5s
    JobseekerApp.Login to jobseeker portal
    JobseekerApp.Apply Events

TC9: Search and Select Mentor
    [Documentation]    This test will verify if user is select a mentor
    [Tags]    09 Test Case: Selecting a Mentor
    JobseekerApp.Login to jobseeker portal
    JobseekerApp.Mentor

TC 10: Jobseeker Password Reset
    [Documentation]    This test will verify if user is able to reset the password
    [Tags]    10 Test Case: Password Reset
    Go to   https://jobs.shenzyn.com/#/user/forgot-password
    MAXIMIZE BROWSER WINDOW
    wait until element is visible    //input[@id='emailId']
    input text    //input[@id='emailId']    saravjeet.singh@hotmail.com
    click button    //button[@class ='ant-btn btn-cta btn-block ant-btn-primary']
    wait until element is visible    //body/div[3]/div[1]/div[2]/div[1]/div[2]/div[1]/div[1]/div[2]/button[1]
    click button    //body/div[3]/div[1]/div[2]/div[1]/div[2]/div[1]/div[1]/div[2]/button[1]

TC 11: Password Reset Email Verification
    [Documentation]    This test will verify if user is receiving email for password reset
    [Tags]    11 Test Case: Password Reset Email Verification
    Open Mailbox    host=smtp.live.com    user=saravjeet.singh@hotmail.com    password=seerat@123
    ${LATEST} =    Wait For Email    sender=noreply@shenzyn.com    subject=Password Reset Token    folder=Inbox    timeout=300
    ${BODY} =    GET EMAIL BODY    ${LATEST}
    should contain    ${BODY}    Your account has been locked due to multiple invalid attempts
    should match regexp    ${BODY}    ${url regexp}
    comment    ${EMAIL_VERIFICATION_TEXT}
   Close Mailbox
