*** Settings ***
Library    SeleniumLibrary    timeout=120s
Library    DateTime
Resource    ../Resources/PO/MainPagePO/LandingPage.robot
Resource    ../Resources/PO/MainPagePO/LoginDetails.robot
Resource    ../Resources/PO/MainPagePO/JobseekerPortalObjects.robot
Resource    ../Resources/PO/UpdateProfilePO/PersonalDetails.robot
Resource    ../Resources/PO/UpdateProfilePO/EducationalDetails.robot
Resource    ../Resources/PO/UpdateProfilePO/ProjectDetails.robot
Resource    ../Resources/PO/UpdateProfilePO/EmploymentDetails.robot
Resource    ../Resources/PO/UpdateProfilePO/UpdateSkills.robot
Resource    ../Resources/PO/UpdateProfilePO/UpdatePreferences.robot
Resource    ../Resources/PO/SavedProfilePO/SavedProfile.robot
Resource    ../Resources/PO/JobsPO/Jobs.robot

*** Keywords ***
Verify Landing Page
    LandingPage.Load
    LandingPage.Verify Page Loaded
    LandingPage.Validate the PageObjects

Login to jobseeker portal
    LandingPage.Load
    LandingPage.Verify Page Loaded
    #LandingPage.Validate the PageObjects
    LoginDetails.LoginID
    LoginDetails.LoginPassword
    click element    //span[contains(text(),'Remember me')]
    click button    //button[@class='ant-btn btn-cta btn-block ant-btn-primary']
    log to console    ${\n}logged in successfully
    log   ${\n}logged in successfully

Validate JSPageObjects
   JobseekerPortalObjects.Verify JSPage Loaded
   JobseekerPortalObjects.Validate the JSPageObjects

Update Profile
    builtin.sleep    2s
    wait until page contains element    //span[contains(text(),'Recommended Jobs')]
    click element    //div[@class='ant-menu-submenu-title']//span//span[@class='nav-text'][contains(text(),'Profile')]
    wait until page contains    Update Profile
    BuiltIn.sleep    2s
    click element    //li//li[1]//a[1]

Update Personal Details
    PersonalDetails.Validate PageObjects
    PersonalDetails.Image Upload
    PersonalDetails.Resume Upload
    PersonalDetails.Video JD Upload
    PersonalDetails.Contact Number
    PersonalDetails.DOB Update
    PersonalDetails.Current Location
    PersonalDetails.Nationality
    PersonalDetails.Linkedin URL
    PersonalDetails.GIT URL
    PersonalDetails.NextPage

Update Educational Details
    builtin.sleep    5s
    click element    //div[contains(text(),'Education Details')]
    EducationalDetails.Validate PageObjects
#    EducationalDetails.Highest Qualification
#    EducationalDetails.Degree
    EducationalDetails.Specialization
    EducationalDetails.Institute
#    EducationalDetails.Highest Qualification 2
#    EducationalDetails.Passing Year and Month
    EducationalDetails.NextPage

Update Employment Details
    builtin.sleep    5s
    click element    //div[contains(text(),'Employment Details')]
    EmploymentDetails.Validate Fresher PageObjects
    EmploymentDetails.Fresher
    click element    (//button)[2]
    click element    (//button)[1]
    wait until page contains element    //input[@id='currentCtc-0']
    clear element text    //input[@id='currentCtc-0']
    input text    //input[@id='currentCtc-0']    10
    builtin.sleep    1s
    click element    (//input[@placeholder='Select date'])[1]
    builtin.sleep    1s
    repeat keyword    10 times    Previous Month Employment
    builtin.sleep    1s
    click element    //div[contains(text(),'20')]
    clear element text    //textarea[@id='employmentDescription-0']
    input text    //textarea[@id='employmentDescription-0']    Testing
    click element    (//span[@class='ant-checkbox'])[2]
    builtin.sleep    1s
    input text    (//input[@role='spinbutton'])[2]      60
    EmploymentDetails.NextPage

Previous Month Employment
    click element    //a[@class='ant-calendar-prev-year-btn']

Update Project Details
    builtin.sleep    5s
    click element    //div[contains(text(),'Projects Details')]
    ProjectDetails.Validate PageObjects
    ProjectDetails.Certification Details
    ProjectDetails.Project Details
    ProjectDetails.Patent Details
    ProjectDetails.Publication Details
    ProjectDetails.NextPage

Update Skills
    builtin.sleep    5s
    click element    //div[contains(text(),'Skills')]
    UpdateSkills.Validate PageObjects
    UpdateSkills.Skills
    UpdateSkills.Languages
    UpdateSkills.Bio
    UpdateSkills.NextPage

Update Preferences
    wait until element is visible    //div[contains(text(),'Preferences')]    timeout=120s
    click element    //div[contains(text(),'Preferences')]
    UpdatePreferences.Validate PageObjects
    UpdatePreferences.Company Size
    UpdatePreferences.Desired CTC
    UpdatePreferences.Preffered Benefits
    UpdatePreferences.NextPage

Saved Profile
    SavedProfile.Navigate to Saved Profile
    SavedProfile.Validate PageObjects
    SavedProfile.Validate Personal Details
    SavedProfile.Validate Educational Details
    SavedProfile.Validate Employment Details
    SavedProfile.Validate Project Details
    SavedProfile.Validate Skill Details
#    SavedProfile.Validate Preferences

#The below section is used for job search and application testing
Navigate to JobMenu
    Jobs.Navigate to JobSearchMenu

SearchBy Skills
    Jobs.Search By Skill

Apply Saved Job
    Jobs.Apply Saved Job

Apply Recommended Job
    Jobs.Apply Recommended Job

Apply Events
    Jobs.Apply Events

Mentor
    Jobs.Select Mentor

Validate Saved Personal Details
    SavedProfile.Navigate to Saved Profile
    SavedProfile.Validate PageObjects
    SavedProfile.Validate Personal Details

Validate Saved Educational Details
    SavedProfile.Navigate to Saved Profile
    SavedProfile.Validate Educational Details

Validate Saved Employment Details
    SavedProfile.Navigate to Saved Profile
    SavedProfile.Validate Employment Details

Validate Saved Project Details
    SavedProfile.Navigate to Saved Profile
    SavedProfile.Validate Project Details

Validate Saved Preferences
    SavedProfile.Navigate to Saved Profile
    SavedProfile.Validate Preferences

Negative Login 1
    LandingPage.Load
    LandingPage.Validate Negative Login 1

Negative Login 2
    LandingPage.Load
    LandingPage.Validate Negative Login 2

Negative Login 3
    LandingPage.Load
    LandingPage.Validate Negative Login 3

Negative Login 4
    LandingPage.Load
    LandingPage.Validate Negative Login 4

Negative Login 5
    LandingPage.Load
    LandingPage.Validate Negative Login 5

Registration
    jobs.jobseeker registration process

Account Lock
    LandingPage.Load
    jobs.account lock testing

Account Locked (Email Sent)
    LandingPage.Load
    jobs.account locked

Account Locked Final
    landingpage.load
    jobs.account locked (reset using email)

Gender Detection (male)
    PersonalDetails.Image Upload (Gender Detection[male])

Gender Detection (female)
    PersonalDetails.Image Upload (Gender Detection[female])
