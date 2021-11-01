*** Settings ***
Library    SeleniumLibrary    timeout=120s
Library    DateTime
Resource    ../Resources/PO/EmployerPO/CommonFunctionality.robot
Resource    ../Resources/PO/EmployerPO/UserDefinedKeywords.robot

*** Keywords ***
Negative Login 1
    UserDefinedKeywords.Validate Negative Login 1

Negative Login 2
    UserDefinedKeywords.Validate Negative Login 2

Negative Login 3
    UserDefinedKeywords.Validate Negative Login 3

Negative Login 4
    UserDefinedKeywords.Validate Negative Login 4

Negative Login 5
    UserDefinedKeywords.Validate Negative Login 5

#Registration
#    jobs.jobseeker registration process
#
Account Lock
    UserDefinedKeywords.account lock testing

Account Locked (Email Sent)
    UserDefinedKeywords.account locked
#
#Account Locked Final
#    landingpage.load
#    jobs.account locked (reset using email)
#
#Gender Detection (male)
#    PersonalDetails.Image Upload (Gender Detection[male])
#
#Gender Detection (female)
#    PersonalDetails.Image Upload (Gender Detection[female])
