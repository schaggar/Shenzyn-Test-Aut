*** Settings ***
Documentation  Basic Login functionality
Resource  ../Resources/PO/EmployerPO/CommonFunctionality.robot
Resource  ../Resources/PO/EmployerPO/UserDefinedKeywords.robot

Test Setup  CommonFunctionality.Start TestCase
Test Teardown  CommonFunctionality.Finish TestCase


*** Variables ***
#${BROWSER} =   firefox
#${STAR_URL} =   http://employer.stage.shenzyn.com/#/user/login
#${LOGIN_ID} =   arun.i@shenzyn.com
#${LOGIN_PASSWORD} =  1204ai!!

*** Test Cases ***


TC1: Verify Employer Basic Login Funtionality
     [Documentation]  Employer Login
     [Tags]  01 Test Case: Verify Login
     UserDefinedKeywords.Login

TC2: Validate Update profile
     [Documentation]  Employer Profile Update
     [Tags]  02 Test Case: Update Profile
     Set selenium speed   1s
     UserDefinedKeywords.Login
     UserDefinedKeywords.Update Profile

TC3: Reset Password
     [Documentation]  Employer Reset Password
     [Tags]  03 Test Case: Reset Password
     UserDefinedKeywords.Reset Password

TC4: Validate Add Recruiter
     [Documentation]  Employer Add Recruitr
     [Tags]  04 Test Case: Add Recruiter
     UserDefinedKeywords.Login
     UserDefinedKeywords.Add Recruiter

TC5: Reset Recruiter Password
     [Documentation]  Employer Reset Recruiter password
     [Tags]  05 Test Case: Reset Recruiter Password
     UserDefinedKeywords.Reset Recruiter password

TC6: Validate Login as a Admin
     [Documentation]  Employer Admin Login
     [Tags]  06 Test Case: Verify Admin Login
     UserDefinedKeywords.Login as Admin

TC7: Validate Search Profiles
     [Documentation]  Employer Search Profile
     [Tags]  06 Test Case: Search Profiles
     UserDefinedKeywords.Login as Admin
     UserDefinedKeywords.Search Profiles

TC8: Validate Post Job
     [Documentation]  Employer Post Job
     [Tags]  08 Test Case: Post Job
     UserDefinedKeywords.Login
     UserDefinedKeywords.Post a Job

TC9: Validate Event Approve
    [Documentation]  Employer Approve Event
    [Tags]  09 Test Case: Approve Event
    UserDefinedKeywords.Login
    UserDefinedKeywords.Approve Event

TC10: Validate Job Approve
    [Documentation]  Employer Job Approve
    [Tags]  10 Test Case: Approve Job
    UserDefinedKeywords.Login
    UserDefinedKeywords.Approve Job