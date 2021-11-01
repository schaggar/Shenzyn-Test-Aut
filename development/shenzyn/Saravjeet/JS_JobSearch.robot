*** Settings ***
Documentation    This test suite will contain the test cases related to jobseeker job search
Resource    ../Resources/JobseekerApp.robot
Resource    ../Resources/CommonApp.robot
Test Setup    CommonApp.Begin Web Test
Test Teardown    CommonApp.End Web Test

*** Variables ***
${BROWSER} =    chrome
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
${VIDEO_JD} =    C:\\Users\\Inderjeet\\Desktop\\Saravjeet\\Shenzyn\\static\\sample-mpg-file.mpg
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
TC1: Search by Skill and Save job
    [Documentation]    This test will verify if user is able to search a job and apply
    [Tags]    Test Case 1: Validate job search by Skills
    JobseekerApp.Login to jobseeker portal
    JobseekerApp.Navigate to JobMenu
    JobseekerApp.SerachBy Skills

#User should be able to login and navigate and update details under jobseeker portal
#TC2: Go to Saved jobs and apply
#    [Documentation]    This test will verify if the user is able to login to the Jobseeker portal
#    [Tags]    Test Case 2: Validate JS Login Funcationality
#    JobseekerApp.Login to jobseeker portal
#
#TC3: Search by Location and Apply
#    [Documentation]    This test will verify if all the objects are present on the jobseeker portal
#    [Tags]    Test Case 3: Validate JS Page Objects
#    JobseekerApp.Login to jobseeker portal
#    JobseekerApp.Validate JSPageObjects
#
#TC4: Search by Salary and Apply
#    [Documentation]    This test will verify if the user is able to login and update the details on the jobseeker portal
#    [Tags]    Test Case 4: Validate Profile Update Funcationality
#    JobseekerApp.Login to jobseeker portal
#    JobseekerApp.Update Profile
#    JobseekerApp.Update Personal Details
#    JobseekerApp.Update Educational Details
#    JobseekerApp.Update Employment Details
#    JobseekerApp.Update Project Details
#    JobseekerApp.Update Skills
#    JobseekerApp.Update Preferences
#
#TC5: Search by Experience and Apply
#    [Documentation]    This test will verify the details under "Saved Profile" page
#    [Tags]    Test Case 5: Validate Saved Profile
#    JobseekerApp.Login to jobseeker portal
#    JobseekerApp.Saved Profile















