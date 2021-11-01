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
${IMAGE_FILE_PATH} =    C:\\gitclonenew\\Shenzyn-Test-Aut\\static\\download.jpg
${RESUME} =    C:\\gitclonenew\\Shenzyn-Test-Aut\\static\\saravjeet.doc
${VIDEO_JD} =    C:\\gitclonenew\\Shenzyn-Test-Aut\\static\\big_buck_bunny_720p_1mb.mp4
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
