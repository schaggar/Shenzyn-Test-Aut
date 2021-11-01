*** Settings ***
Library    SeleniumLibrary
Library     ImapLibrary2

Resource    ../../Resources/PO/HiringPartner_PO/CommonFunctionality_Prod.robot
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

*** Test Cases ***
Landing page
    [Documentation]    Testcase to validate landing page
    [Tags]     Test Case 01: Validate Landing page
    CommonFunctionality_Prod.Start testcase
    CommonFunctionality.End testcase

Login
    [Documentation]    Testcase to validate Login as Admin and Recruiter
    [Tags]     Test Case 02: Validate Login as Admin and Recruiter
    CommonFunctionality_Prod.Start testcase
    UserDefinedkeywords.Login as Admin on Prod
    Builtin.sleep   20s
    PartnerLogin.Admin signout
#    UserDefinedkeywords.Login as Recruiter on Prod
#    PartnerLogin.Recruiter signout
    CommonFunctionality.End testcase

Add recruiter
    [Documentation]    Testcase to check if Partner admin can add Recruiter
    [Tags]     Test Case 03: Verify Add recruiter as Partner admin
    CommonFunctionality_Prod.Start testcase
    UserDefinedkeywords.Login as Admin on Prod
    PartnerAddRecruiter.Add a recruiter
    CommonFunctionality.End testcase

Shortlist jobs
    [Documentation]    Testcase to check if user can Shortlist jobs
    [Tags]     Test Case 04: Verify Shortlist jobs as Admin
    CommonFunctionality_Prod.Start testcase
    UserDefinedkeywords.Login as Admin on Prod
    PartnerShortlistjobs.Shortlist jobs
    CommonFunctionality.End testcase

Enroll event
    [Documentation]    Testcase to check if user can Enroll for events
    [Tags]     Test Case 05: Verify enroll event as a admin
    CommonFunctionality_Prod.Start testcase
    UserDefinedkeywords.Login as Admin on Prod
    PartnerEnrollEvent.Enroll for an event
    CommonFunctionality.End testcase

UploadProfile for an event
    [Documentation]    Testcase to check if user can upload profile for an event
    [Tags]     Test Case 06: Check upload profile for an event
    CommonFunctionality_Prod.Start testcase
    UserDefinedkeywords.Login as Recruiter on Prod
    PartnerUploadProfile_Event.Upload profile for event
    CommonFunctionality.End testcase

UploadProfile for an job
    [Documentation]    Testcase to check if user can upload profile for an JOB
    [Tags]     Test Case 07: Check upload profile for an JOB
    CommonFunctionality_Prod.Start testcase
    UserDefinedkeywords.Login as Admin on Prod
    PartnerUploadProfile_Job.Upload profile for job
    CommonFunctionality.End testcase

Admin See Profiles
    [Documentation]    Testcase to check if Admin can see the profiles submitted by the recruiter
    [Tags]     Test Case 08: Check if Admin can see the profiles
    CommonFunctionality_Prod.Start testcase
    UserDefinedkeywords.Login as Admin on Prod
    PartnerAdminSeeProfiles.Check profiles submitted for a job
    PartnerAdminSeeProfiles.Check profiles submitted for a event
    CommonFunctionality.End testcase

Password reset and email verfication when a recruiter is added
    [Documentation]    Testcase to verify if Recruiter receives the mail after been added by the ADMin
    [Tags]    Test Case 09: Reset password/Verification Email

    Open Mailbox    host=smtp.live.com    user=Sharanya_test@hotmail.com    password=She@1234
    ${LATEST} =    Wait For Email    sender=noreply@shenzyn.com    subject=Password Reset Token    folder=Inbox    timeout=300
    ${BODY} =    GET EMAIL BODY    ${LATEST}
#    should contain    ${BODY}    Please Verify Your Account and Set Password By Clicking the Confirm Link Confirm
#    should match regexp    ${BODY}    ${url regexp}
    comment    ${EMAIL_VERIFICATION_TEXT}
    Close Mailbox


Password Reset
    [Documentation]    Testcase to check reset password
    [Tags]     Test Case 10: Check if user can receive mail for reset password
    CommonFunctionality_Prod.Start testcase
    PasswordReset.Password reset
    CommonFunctionality.End testcase

    Open Mailbox    host=smtp.live.com    user=Sharanya_test@hotmail.com    password=She@1234
    ${LATEST} =    Wait For Email    sender=noreply@shenzyn.com    subject=Password Reset Token    folder=Inbox    timeout=300
    ${BODY} =    GET EMAIL BODY    ${LATEST}
#    should contain    ${BODY}    Hello, Your account has been locked due to multiple invalid attempts.Please reset your password by clicking the link here.
#    should match regexp    ${BODY}    ${url regexp}
    comment    ${EMAIL_VERIFICATION_TEXT}
    Close Mailbox

#Delete Recruiter
#    [Documentation]    Testcase to check if Admin can delete recruiter
#    [Tags]     Test Case 09: Check if Admin delete recruiter
#    CommonFunctionality_Prod.Start testcase
#    UserDefinedkeywords.Login as Admin on Prod
#    DeleteRecruiter.Delete recruiter
#    CommonFunctionality.End testcase

View reports as admin
    [Documentation]    Testcase to check if Partner admin can view reports
    [Tags]     Test Case 13: Verify View reports for Partner admin
    CommonFunctionality.Start testcase
    UserDefinedkeywords.Login as Admin
    Reports.View reports
    CommonFunctionality.End testcase

Upload profile for event as recruiter
    [Documentation]    Testcase to check if Partner can Upload profile for event as recruiter
    [Tags]     Test Case 14: Verify Upload profile for event as recruiter
    CommonFunctionality.Start testcase
    UserDefinedkeywords.Login as Recruiter
    PartnerUpload_Event_RE.Recruiter Upload profile for event
    CommonFunctionality.End testcase

Upload profile for job as recruiter
    [Documentation]    Testcase to check if Partner can  Upload profile for job as recruiter
    [Tags]     Test Case 15: Verify Upload profile for job as recruiter
    CommonFunctionality.Start testcase
    UserDefinedkeywords.Login as Admin
    PartnerUpload_Job_RE.Recruiter Upload profile for job
    CommonFunctionality.End testcase

