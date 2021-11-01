*** Settings ***
Documentation    This is some basic information about the suite
Resource    ../Resources/JobseekerApp.robot
Resource    ../Resources/CommonApp.robot
Test Setup    CommonApp.Begin Web Test
Test Teardown    CommonApp.End Web Test

*** Variables ***
${BROWSER} =    chrome
${START_URL} =    http://js.stage.shenzyn.com/
${LOGIN_ID} =    saravjeet.singh@hotmail.com
${LOGIN_PASSWORD} =    s33rat@123
${USER_NAME} =    Saravjeet Chaggar
${IMAGE_FILE_PATH} =    C:\\Users\\Inderjeet\\Desktop\\Saravjeet\\Shenzyn\\static\\download.jpg
${RESUME} =    C:\\Users\\Inderjeet\\Desktop\\Saravjeet\\Shenzyn\\static\\saravjeet.doc
${VIDEO_JD} =    C:\\Users\\Inderjeet\\Desktop\\Saravjeet\\Shenzyn\\static\\sample-mpg-file.mpg


*** Test Cases ***

Validate updates on Profile
    [Documentation]    This test will verify if the user is able to login and update the details on the jobseeker portal
    [Tags]    Update Jobseeker Profile
    JobseekerApp.Login to jobseeker portal
    JobseekerApp.Update Profile
    JobseekerApp.Update Personal Details
    builtin.sleep    5s
#    click element    xpath=//div[@class='steps-action']//button[@class='ant-btn ant-btn-primary']
#    builtin.sleep    3s
#    click button    xpath=//div[3]/button[2]
#    builtin.sleep    3s
#    click button    //div[@class='steps-action']/button[2]
#    builtin.sleep    3s
#    click element    //div[contains(text(),'Employment Details')]
#    JobseekerApp.Update Employment Details
#    click element    //div[contains(text(),'Skills')]
#    JobseekerApp.Update Skills

#    click element    //div[contains(text(),'Preferences')]
#    JobseekerApp.Update Preferences














