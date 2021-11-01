*** Settings ***
Documentation  Employer Automation
Resource  ../../Resources/CommonFunctionalityProd.robot
Resource  ../../Resources/UserDefinedKeywordsProd.robot

Test Setup  CommonFunctionalityProd.Start TestCases
Test Teardown  CommonFunctionalityProd.Finish TestCase


*** Variables ***
#${BROWSER} =   firefox
#${STAR_URL} =   https://employer.shenzyn.com/#/user/login
#${LOGIN_ID} =   arun.i@shenzyn.com
#${LOGIN_PASSWORD} =  1204ai!!

*** Test Cases ***
TC1: Verify Employer Basic Login Funtionality
     [Documentation]  Employer Login
     [Tags]  01 Test Case: Verify Login
     UserDefinedKeywordsProd.Login

TC2: Validate Update profile
     [Documentation]  Employer Profile Update
     [Tags]  02 Test Case: Update Profile
     Set selenium speed   1s
     UserDefinedKeywordsProd.Login
     UserDefinedKeywordsProd.Update Profile

TC3: Reset Password
     [Documentation]  Employer Reset Password
     [Tags]  03 Test Case: Reset Password
     UserDefinedKeywordsProd.Reset Password

TC4: Validate Add Recruiter
     [Documentation]  Employer Add Recruitr
     [Tags]  04 Test Case: Add Recruiter
     UserDefinedKeywordsProd.Login
     UserDefinedKeywordsProd.Add Recruiter

TC5: Reset Recruiter Password
     [Documentation]  Employer Reset Recruiter password
     [Tags]  05 Test Case: Reset Recruiter Password
     UserDefinedKeywordsProd.Reset Recruiter password

TC6: Validate Login as a Admin
     [Documentation]  Employer Admin Login
     [Tags]  06 Test Case: Verify Admin Login
     UserDefinedKeywordsProd.Login as Admin

TC7: Validate Search Profiles
     [Documentation]  Employer Search Profile
     [Tags]  06 Test Case: Search Profiles
     UserDefinedKeywordsProd.Login as Admin
     UserDefinedKeywordsProd.Search Profiles

TC8: Validate Post Job
     [Documentation]  Employer Post Job
     [Tags]  08 Test Case: Post Job
     UserDefinedKeywordsProd.Login
     UserDefinedKeywordsProd.Post a Job

TC9: Validate Event Approve
    [Documentation]  Employer Approve Event
    [Tags]  09 Test Case: Approve Event
    UserDefinedKeywordsProd.Login
    UserDefinedKeywordsProd.Approve Event

TC10: Validate Job Approve
    [Documentation]  Employer Job Approve
    [Tags]  10 Test Case: Approve Job
    UserDefinedKeywordsProd.Login
    UserDefinedKeywordsProd.Approve Job



