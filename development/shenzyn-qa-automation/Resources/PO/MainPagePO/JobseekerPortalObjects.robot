*** Settings ***
Library    SeleniumLibrary

*** Variables ***

*** Keywords ***
Verify JSPage Loaded
    MAXIMIZE BROWSER WINDOW
    BuiltIn.sleep    5s

Validate the JSPageObjects
    BuiltIn.sleep    3s
    page should contain image    Shenzyn
    page should contain element    //div[1]/div[1]/ul[1]/li[1]/a[1]
    page should contain    Profile
    page should contain    Dashboard
    page should contain    Jobs
    page should contain    Events
    page should contain    Trainings
    page should contain    Mentors
    page should contain    Recommended Jobs
    page should contain    Saved Jobs
    page should contain    Applied Jobs
    page should contain    Profile Views
    page should contain    ${USER_NAME}
    click element    //div[@class='ant-menu-submenu-title']//span//span[@class='nav-text'][contains(text(),'Profile')]
    BuiltIn.sleep    2s
    element text should be    //div[1]/div[1]/ul[1]/li[1]/a[1]    Dashboard
    element text should be    //ul[1]/li[3]/ul[1]/li[1]/a[1]    Update Profile
    element text should be    //ul[1]/li[3]/ul[1]/li[2]/a[1]    Saved Profile

    click element    //div[@class='ant-menu-submenu-title']//span//span[@class='nav-text'][contains(text(),'Jobs')]
    BuiltIn.sleep    2s
    element text should be    //ul[1]/li[4]/ul[1]/li[1]/a[1]    Saved/Applied Jobs
    element text should be    //ul[1]/li[4]/ul[1]/li[2]/a[1]    Search Jobs
    element text should be    //ul[1]/li[4]/ul[1]/li[3]/a[1]    Recommended Jobs

    click element    (//span[contains(text(),'Trainings')])[1]
    BuiltIn.sleep    2s
    element text should be    //span[contains(text(),'Invited Trainings')]    Invited Trainings
    element text should be    //div[1]/div[1]/ul[1]/li[6]/ul[1]/li[2]/a[1]    Registered Trainings

    click element    //div[@class='ant-menu-submenu-title']//span//span[@class='nav-text'][contains(text(),'Mentors')]
    BuiltIn.sleep    2s

    element text should be    //ul[1]/li[7]/ul[1]/li[1]/a[1]    Find Mentor
    element text should be    //ul[1]/li[7]/ul[1]/li[2]/a[1]    My Mentor
