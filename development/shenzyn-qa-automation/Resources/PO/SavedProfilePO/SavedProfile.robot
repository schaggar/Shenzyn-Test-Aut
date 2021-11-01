*** Settings ***
Library    SeleniumLibrary

*** Variables ***

*** Keywords ***
Navigate to Saved Profile
    wait until element is visible    //div[@class='ant-menu-submenu-title']//span//span[@class='nav-text'][contains(text(),'Profile')]    timeout=120s
    click element    //div[@class='ant-menu-submenu-title']//span//span[@class='nav-text'][contains(text(),'Profile')]
    wait until element is visible    //div[1]/ul[1]/li[3]/ul[1]/li[2]/a[1]    timeout=120s
    click link    //div[1]/ul[1]/li[3]/ul[1]/li[2]/a[1]
    log to console    Navigated Successfully to Saved Profile

Validate PageObjects
    wait until element is visible    //h3[contains(text(),'${USER_NAME}')]    timeout=120s
    element text should be    //h3[contains(text(),'${USER_NAME}')]    ${USER_NAME}
    element text should be    //span[contains(text(),'${USER_NAME}')]    ${USER_NAME}
    element text should be    //h3[contains(text(),'Profile Status')]    Profile Status
    element text should be    //h4[contains(text(),'Need Help?')]    Need Help?
    element text should be    //p[contains(text(),'Do you need help to build your profile?')]    Do you need help to build your profile?
    page should contain element    //span[contains(text(),'Profile Builder')]
    page should contain link    //a[contains(text(),'About')]
    page should contain link    //a[contains(text(),'Careers')]
    page should contain link    //a[contains(text(),'Help & Support')]
    page should contain link    //a[contains(text(),'Privacy')]
    page should contain link    //a[contains(text(),'Terms')]
    page should contain link    ${BOTTOM_PAGELINK_LINKEDIN}
    page should contain link    ${BOTTOM_PAGELINK_FACEBOOK}
    page should contain link    ${BOTTOM_PAGELINK_TWITTER}
    page should contain link    ${BOTTOM_PAGELINK_INSTAGRAM}
    page should contain link    ${BOTTOM_PAGELINK_YOUTUBE}
    element text should be    //span[contains(text(),'© 2020 4GEN Technologies Pvt. Ltd. All Rights Rese')]    © 2020 4GEN Technologies Pvt. Ltd. All Rights Reserved.
    element text should be    //div[contains(text(),'Personal Details')]    Personal Details
    element text should be    //div[contains(text(),'Education')]    Education
    element text should be    //div[contains(text(),'Employment')]    Employment
    element text should be    //div[contains(text(),'Projects')]    Projects
    element text should be    //div[contains(text(),'Skills')]    Skills
    element text should be    //div[contains(text(),'Preferences')]    Preferences
    page should contain element    //a[contains(text(),'Resume')]
    page should contain element    //span[contains(text(),'Video Profile')]
    log to console    Page Objects Validated Successfully
    log    Page Objects Validated Successfully

Validate Personal Details
    wait until element is visible    //div[contains(text(),'Personal Details')]    timeout=120s
    click element    //div[contains(text(),'Personal Details')]
    #Validate Object Attributes
    element text should be    //h4[contains(text(),'Full Name')]    Full Name
    element text should be    //h4[contains(text(),'Date of Birth')]    Date of Birth
    element text should be    //h4[contains(text(),'Email ID')]    Email ID
    element text should be    //h4[contains(text(),'Contact Number')]    Contact Number
    element text should be    //h4[contains(text(),'Current Location')]    Current Location
    element text should be    //h4[contains(text(),'Nationality')]    Nationality
    #Validate the Data filled in Update Profile Section
    element text should be    //h3[contains(text(),'${USER_NAME}')]    ${USER_NAME}
    element text should be    //p[contains(text(),'${USER_NAME}')]    ${USER_NAME}
    element text should be    //h5[contains(text(),'${CURRENT_LOCATION}')]    ${CURRENT_LOCATION}
    element text should be    //p[contains(text(),'${EMAIL}')]    ${EMAIL}
    element text should be    //p[contains(text(),'${CONTACT_NO}')]    ${CONTACT_NO}
    element text should be    //p[contains(text(),'${CURRENT_LOCATION}')]    ${CURRENT_LOCATION}
    element text should be    //p[contains(text(),'${NATIONALITY}')]    ${NATIONALITY}
    log to console    Saved Personal Details Validated Successfully.
    log    Saved Personal Details Validated Successfully.

Validate Educational Details
    wait until element is visible    //div[contains(text(),'Education')]    timeout=120s
    click element    //div[contains(text(),'Education')]
    log to console    Navigated to Saved Education Page
    #Validate Page Objects
    wait until element is visible    //h4[contains(text(),'Highest Qualifications')]    timeout=120s
    element text should be    //h4[contains(text(),'Highest Qualifications')]    Highest Qualifications
    element text should be    //h4[contains(text(),'Degree')]    Degree
    element text should be    //h4[contains(text(),'Specialization')]    Specialization
    element text should be    //h4[contains(text(),'Institute')]    Institute
    element text should be    //h4[contains(text(),'Education Type')]    Education Type
    element text should be    //h4[contains(text(),'Passing Year and Month')]    Passing Year and Month
    #Validate the data filled in the update profile section
    element text should be    //p[contains(text(),'Graduation')]    Graduation
    element text should be    //p[contains(text(),'${DEGREE}')][1]    ${DEGREE}
    element text should be    //p[contains(text(),'${SPECIALIZATION}')]    ${SPECIALIZATION}
    element text should be    //p[contains(text(),'${INSTITUTE}')]    ${INSTITUTE}
    element text should be    //p[contains(text(),'Full Time')]    Full Time
    element text should be    //time[contains(text(),'2003 Jan')]    2003 Jan
    log to console    Educational Saved Details Validated Successfully.
    log    Saved Educational Details Validated Successfully.

Validate Employment Details
    log to console    Moved to Employment Section
    log    Moved to Employment Section
    wait until element is visible    (//div[contains(text(),'Employment')])[1]    timeout=120s
    click element    (//div[contains(text(),'Employment')])[1]
    element text should be    //p[contains(text(),'Data engineer')]    Data engineer
    element text should be    //p[contains(text(),'Teradata')]    Teradata
    element text should be    //p[contains(text(),'10 LPA')]    10 LPA
    element text should be    //p[contains(text(),'20 Sep 2011')]    20 Sep 2011
    element text should be    (//p[contains(text(),'Testing')])[1]    Testing
    log to console    Employment Details Validated Successfully.
    log    Employment Details Validated Successfully.

Validate Project Details
    wait until element is visible    //div[@class='ant-tabs-nav ant-tabs-nav-animated']/div/div[4]    timeout=120s
    click element    //div[@class='ant-tabs-nav ant-tabs-nav-animated']/div/div[4]
    element text should be    (//div[@class='ant-collapse-content-box']/h4[1])[1]    Title: Automating Jobseeker Portal
    element text should be    (//div[@class='ant-collapse-content-box']/h4[1])[2]    Title: Testing Patent
    element text should be    (//div[@class='ant-collapse-content-box']/h4[1])[3]    Title: Testing Publication Field
    element text should be    //p[1]/span[1]    JAVA, ETL,
    element text should be    //h4[contains(text(),'Patent Issued Authority :')]    Patent Issued Authority :
    element text should be    //h4[contains(text(),'Publication Link :')]    Publication Link :
    element text should be    //p[contains(text(),'Selenium Testing')]    Selenium Testing
    element text should be    //p[contains(text(),'Issuing Authority Testing')]    Issuing Authority Testing
    element text should be    //a[contains(text(),'Publication Link')]    Publication Link
    page should contain link    Publication Link    timeout=120s
    log to console    Project Details Validated Successfully.
    log   Project Details Validated Successfully.

Validate Skill Details
    builtin.sleep    2s
    click element    //div[contains(text(),'Skills')]

Validate Preferences
    wait until element is visible    //div[@class='ant-tabs-nav ant-tabs-nav-animated']/div/div[6]    timeout=120s
    click element    //div[@class='ant-tabs-nav ant-tabs-nav-animated']/div/div[6]
    element text should be    //div[6]/div[2]/p[1]    Startups(0-100)
    element text should be    //div[6]/div[2]/p[2]/span[1]    infosys,
    element text should be    //div[6]/div[2]/p[2]/span[2]    wipro,
    element text should be    //p[contains(text(),'10')]    10
    element text should be    //div[2]/p[4]/span[1]    Pune,
    #element text should be    //div[2]/p[5]/span[1]    Social Activities,
    #element text should be    //div[2]/p[5]/span[2]    Work from Home,
    #element text should be    //span[contains(text(),'There is No Preferred Companies')]    There is No Preferred Companies
    log to console    Preferences Validated Successfully.
    log    Preferences Validated Successfully.
