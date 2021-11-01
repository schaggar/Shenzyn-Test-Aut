*** Settings ***
Library    SeleniumLibrary
Library     ImapLibrary2

Resource    ../Resources/PO/HiringPartner_PO/CommonFunctionality.robot
Resource    ../Resources/PO/HiringPartner_PO/UserDefinedkeywords.robot
Resource    ../Sharanya/PartnerAddRecruiter.robot
Resource    ../Sharanya/PartnerAdminSeeProfiles.robot
Resource    ../Sharanya/PartnerEnrollEvent.robot
Resource    ../Sharanya/PartnerLogin.robot
Resource    ../Sharanya/PartnerShortlistjobs.robot
Resource    ../Sharanya/PartnerSubscription.robot
Resource    ../Sharanya/PartnerUploadProfile_Event.robot
Resource    ../Sharanya/PartnerUploadProfile_Job.robot
Resource    ../Sharanya/DeleteRecruiter.robot
Resource    ../Sharanya/PasswordReset.robot
#Resource    ../Sharanya/Verifcation.robot


*** Test Cases ***

Landing page
    [Documentation]    Testcase to validate landing page
    [Tags]     Test Case 01: Validate Landing page
    CommonFunctionality.Start testcase
    CommonFunctionality.End testcase

Login
    [Documentation]    Testcase to validate Login as Admin and Recruiter
    [Tags]     Test Case 02: Validate Login as Admin and Recruiter
    CommonFunctionality.Start testcase
    UserDefinedkeywords.Login as Admin
    PartnerLogin.Admin signout
    UserDefinedkeywords.Login as Recruiter
    PartnerLogin.Recruiter signout
    CommonFunctionality.End testcase

Subscription
    [Documentation]    Testcase to verify Subscription
    [Tags]     Test Case 03: Verify subscription
    CommonFunctionality.Start testcase
    PartnerSubscription.Login details for sub
    PartnerSubscription.Subscription
    CommonFunctionality.End testcase

Shortlist jobs
    [Documentation]    Testcase to check if user can Shortlist jobs
    [Tags]     Test Case 05: Verify subscription
    CommonFunctionality.Start testcase
    UserDefinedkeywords.Login as Admin
    PartnerShortlistjobs.Shortlist jobs
    CommonFunctionality.End testcase

Enroll event
    [Documentation]    Testcase to check if user can Enroll for events
    [Tags]     Test Case 06: Verify enroll event as a admin
    CommonFunctionality.Start testcase
    UserDefinedkeywords.Login as Admin
    PartnerEnrollEvent.Enroll for an event
    CommonFunctionality.End testcase

Add recruiter
    [Documentation]    Testcase to check if Partner admin can add Recruiter
    [Tags]     Test Case 10: Verify Add recruiter as Partner admin
    CommonFunctionality.Start testcase
    UserDefinedkeywords.Login as Admin
    PartnerAddRecruiter.Add a recruiter
    CommonFunctionality.End testcase

Password reset and email verfication when a recruiter is added
    [Documentation]    Testcase to verify if Recruiter receives the mail after been added by the ADMin
    [Tags]    Test Case 11: Reset password/Verification Email

    Open Mailbox    host=smtp.live.com    user=Sharanya_test@hotmail.com    password=She@1234
    ${LATEST} =    Wait For Email    sender=noreply@shenzyn.com    subject=Password Reset Token    folder=Inbox    timeout=300
    ${BODY} =    GET EMAIL BODY    ${LATEST}
#    should contain    ${BODY}    Please Verify Your Account and Set Password By Clicking the Confirm Link Confirm
#    should match regexp    ${BODY}    ${url regexp}
    comment    ${EMAIL_VERIFICATION_TEXT}
    Close Mailbox

UploadProfile for an event
    [Documentation]    Testcase to check if user can upload profile for an event
    [Tags]     Test Case 07: Check upload profile for an event
    CommonFunctionality.Start testcase
    UserDefinedkeywords.Login as Admin
    PartnerUploadProfile_Event.Upload profile for event
    CommonFunctionality.End testcase

UploadProfile for an job
    [Documentation]    Testcase to check if user can upload profile for an JOB
    [Tags]     Test Case 08: Check upload profile for an JOB
    CommonFunctionality.Start testcase
    UserDefinedkeywords.Login as Admin
    PartnerUploadProfile_Job.Upload profile for job
    CommonFunctionality.End testcase

Admin See Profiles
    [Documentation]    Testcase to check if Admin can see the profiles submitted by the recruiter
    [Tags]     Test Case 09: Check if Admin can see the profiles
    CommonFunctionality.Start testcase
    UserDefinedkeywords.Login as Admin
    PartnerAdminSeeProfiles.Check profiles submitted for a job
    PartnerAdminSeeProfiles.Check profiles submitted for a event
    CommonFunctionality.End testcase

Password Reset
    [Documentation]    Testcase to check reset password
    [Tags]     Test Case 12: Check if user can receive mail for reset password
    CommonFunctionality.Start testcase
    PasswordReset.Password reset
    CommonFunctionality.End testcase

    Open Mailbox    host=smtp.live.com    user=Sharanya_test@hotmail.com    password=She@1234
    ${LATEST} =    Wait For Email    sender=noreply@shenzyn.com    subject=Password Reset Token    folder=Inbox    timeout=300
    ${BODY} =    GET EMAIL BODY    ${LATEST}
#    should contain    ${BODY}    Hello, Your account has been locked due to multiple invalid attempts.Please reset your password by clicking the link here.
#    should match regexp    ${BODY}    ${url regexp}
    comment    ${EMAIL_VERIFICATION_TEXT}
    Close Mailbox



