*** Settings ***
Library    ImapLibrary

*** Test Cases ***
Email Verification
    Open Mailbox    host=imap.godaddy.com    user=sharanya.d@shenzyn.com    password=Shreu2311//
    ${LATEST} =    Wait For Email    sender=noreply@shenzyn.com    timeout=300
    ${HTML} =    Open Link From Email    ${LATEST}
    Should Contain    ${HTML}    Your email address has been updated
    Close Mailbox
