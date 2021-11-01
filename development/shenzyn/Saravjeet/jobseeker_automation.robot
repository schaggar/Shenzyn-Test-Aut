*** Settings ***
Documentation    This test suite will contain the test cases related to jobseeker profile updation
Resource    ../Resources/JobseekerApp.robot
Resource    ../Resources/CommonApp.robot
Test Setup    CommonApp.Begin Web Test
Test Teardown    CommonApp.End Web Test

*** Variables ***
${BROWSER} =    firefox
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
${IMAGE_FILE_PATH} =    C:\\Users\\Inderjeet\\Desktop\\Saravjeet\\Shenzyn\\static\\download.jpg
${RESUME} =    C:\\Users\\Inderjeet\\Desktop\\Saravjeet\\Shenzyn\\static\\saravjeet.doc
${VIDEO_JD} =    C:\\Users\\Inderjeet\\Desktop\\Saravjeet\\Shenzyn\\static\\big_buck_bunny_720p_1mb.mp4
${CURRENT_LOCATION} =    Dibang Valley, Arunachal Pradesh
${NATIONALITY} =    UK, British
${LINKEDIN} =    www.linkedin.com/in/schaggar
${GIT} =    https://github.com/schaggar
${CONTACT_NO} =    9975568427

#Educational Details
${DEGREE} =    Computer Science
${SPECIALIZATION} =    Computer Science
${INSTITUTE} =    SSCET

*** Test Cases ***
#TC1: Validate Landing Page
#    [Documentation]    This test will verify if the objects or links present and working on the jobseeker landing page
#    [Tags]    01 Test Case: Validate JS Landing Page
#    JobseekerApp.Verify Landing Page
#
#TC2: Validate Login Functionality
#    [Documentation]    This test will verify if the user is able to login to the Jobseeker portal
#    [Tags]    02 Test Case: Validate JS Login Funcationality
#    JobseekerApp.Login to jobseeker portal
#
#TC3: Validate JobSeekerPage
#    [Documentation]    This test will verify if all the objects are present on the jobseeker portal
#    [Tags]    Test Case 3: Validate JS Page Objects
#    JobseekerApp.Login to jobseeker portal
#    JobseekerApp.Validate JSPageObjects

TC4: Validate Updates on Profile
    [Documentation]    This test will verify if the user is able to login and update the details on the jobseeker portal
    [Tags]    04 Test Case: Validate Profile Update Functionality
    set selenium speed    1s
    JobseekerApp.Login to jobseeker portal
    JobseekerApp.Update Profile
    JobseekerApp.Update Personal Details
    JobseekerApp.Update Educational Details
    JobseekerApp.Update Employment Details
    JobseekerApp.Update Project Details
    JobseekerApp.Update Skills
    JobseekerApp.Update Preferences

##TC5: Validate Saved Profile
##    [Documentation]    This test will verify the details under "Saved Profile" page
##    [Tags]    Test Case 5: Validate Saved Profile
##    JobseekerApp.Login to jobseeker portal
##    JobseekerApp.Saved Profile
##
#TC5: Search by Skill and Save job
#    [Documentation]    This test will verify if user is able to search a job and apply
#    [Tags]    05 Test Case: Validate job search by Skills
#    set selenium speed    0.5s
#    JobseekerApp.Login to jobseeker portal
#    JobseekerApp.Navigate to JobMenu
#    JobseekerApp.SerachBy Skills
#
#TC6: Apply Saved Job
#    [Documentation]    This test will verify if user is able to apply the job
#    [Tags]    06 Test Case: Apply saved job
#    JobseekerApp.Login to jobseeker portal
#    JobseekerApp.Apply Saved Job
#
#TC7: Recommeded Job Application
#    [Documentation]    This test will verify if user is able the recommended jobs
#    [Tags]    07 Test Case: Apply Recommended job
#    JobseekerApp.Login to jobseeker portal
#    JobseekerApp.Apply Recommended Job
#TC8: Apply for Events
#    [Documentation]    This test will verify if user is able the recommended jobs
#    [Tags]    08 Test Case: Apply Events
#    JobseekerApp.Login to jobseeker portal
#    JobseekerApp.Apply Recommended Job
#
#TC9: Search and Select Mentor
#    [Documentation]    This test will verify if user is select a mentor
#    [Tags]    09 Test Case: Selecting a Mentor
#    JobseekerApp.Login to jobseeker portal
#    JobseekerApp.Mentor














