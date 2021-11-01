*** Settings ***
Library    ImapLibrary2
Library    re
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

#Email Verification - password reset
${url regexp}    http[s]?://(?:[a-zA-Z]|[0-9]|[$-_@.&+]|[!*\(\),]|(?:%[0-9a-fA-F][0-9a-fA-F]))+
${EMAIL_VERIFICATION_TEXT} =    Email Verified Successfully.

*** Test Cases ***
TC 10: Jobseeker Password Reset
    [Documentation]    This test will verify if user is able to reset the password
    [Tags]    10 Test Case: Password Reset
    Go to   ${START_URL}#/user/forgot-password
    MAXIMIZE BROWSER WINDOW
    wait until element is visible    //input[@id='emailId']
    input text    //input[@id='emailId']    saravjeet.singh@hotmail.com
    click button    //button[@class ='ant-btn btn-cta btn-block ant-btn-primary']
    wait until element is visible    //body/div[3]/div[1]/div[2]/div[1]/div[2]/div[1]/div[1]/div[2]/button[1]
    click button    //body/div[3]/div[1]/div[2]/div[1]/div[2]/div[1]/div[1]/div[2]/button[1]
    builtin.sleep    60s

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
