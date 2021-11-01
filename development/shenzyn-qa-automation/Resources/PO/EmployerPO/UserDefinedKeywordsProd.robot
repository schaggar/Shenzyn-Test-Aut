*** Settings ***

Library  SeleniumLibrary
Library  pyautogui
Library  ImageHorizonLibrary

*** Variables ***
${IMAGE_FILE_PATH}   \\Users\\dell\\Desktop\\Upload Picture\\Picture1.jpg
${Resume}      \\Users\\dell\\Desktop\\Upload Picture\\Resume 1.doc
${Video_JD}   \\Users\\dell\\Desktop\\Upload Picture\\Video 1.mp4

*** Keywords ***
Login
    Input Text  //*[@id="emailId"]  mnimbargimath@gmail.com
    BuiltIn.sleep  2s
    Input Password  //*[@id="password"]  Shenzyn1234
    BuiltIn.sleep  2s
    Click Button  //html/body/div/div/div/div/div/section/div[2]/section/form/div[4]/div/div/span/button
    BuiltIn.sleep  10s


Update Profile
  # Basic Detailes
    set selenium speed  1s
    Click Button  //html/body/div[1]/div/div/section/section/section/main/div/div/div[1]/section/div[2]/div/h4[1]/button
    BuiltIn.sleep  2s
    Click element  //html/body/div/div/div/section/section/section/main/div/div/div/div/div/div/div/section/article/div[2]/section/form/div[1]/div[2]/div/span/span/div/span
    BuiltIn.sleep  3s
    pyautogui.typewrite   ${IMAGE_FILE_PATH}
    BuiltIn.sleep  3s
    ImageHorizonLibrary.Press Combination   Key.enter
    BuiltIn.sleep  3s
    Input Text  //*[@id="industry"]  Information Technology
    BuiltIn.sleep  2s
    Input Text  //*[@id="website"]  www.shenzyn.com
    BuiltIn.sleep  2s
    Input Text  //html/body/div[1]/div/div/section/section/section/main/div/div/div/div/div/div/div/section/article/div[2]/section/form/div[5]/div[2]/div/span/div/div/div/ul/li/div/input  +91
    BuiltIn.sleep  2s
    Input Text  //*[@id="contactno"]  8861452547
    BuiltIn.sleep  2s
    Input Text  //*[@id="address"]  1172, J P Nagar, 1st Cross.
    BuiltIn.sleep  2s
    input text  //*[@id="location"]/div/div/ul/li/div/input     Bangalore
    BuiltIn.sleep  2s
    ImageHorizonLibrary.Press Combination   Key.enter
    BuiltIn.sleep  2s
    Input Text  //*[@id="pincode"]  586100
    BuiltIn.sleep  2s
    Input Text  //*[@id="gstin"]  18AABCT3518Q1ZV
    BuiltIn.sleep  2s
    Input Text  //*[@id="sachsn"]  1100
    BuiltIn.sleep  2s
    Click Button  //*[@id="app-content"]/div/div/div/div/div/div/div/section/article/div[4]/button
    BuiltIn.sleep  3s

  # Advanced Detailes
    Input Text  //html/body/div[1]/div/div/section/section/section/main/div/div/div/div/div/div/div/section/article/div[2]/section/form/div[1]/div[2]/div/span/span/textarea  xyz
    BuiltIn.sleep  2s
    Input Text  //html/body/div[1]/div/div/section/section/section/main/div/div/div/div/div/div/div/section/article/div[2]/section/form/div[2]/div[2]/div/span/span/textarea  abcd
    BuiltIn.sleep  2s
    Input Text  //*[@id="es"]  150
    BuiltIn.sleep  2s
    Input Text  //*[@id="gd"]  30%
    BuiltIn.sleep  2s
    Input Text  //html/body/div[1]/div/div/section/section/section/main/div/div/div/div/div/div/div/section/article/div[2]/section/form/div[5]/div[2]/div/span/span/input  Null
    BuiltIn.sleep  2s
    Input Text  //html/body/div[1]/div/div/section/section/section/main/div/div/div/div/div/div/div/section/article/div[2]/section/form/div[5]/div[2]/div/span/span/input  Null
    BuiltIn.sleep  2s
    Click Button  //html/body/div[1]/div/div/section/section/section/main/div/div/div/div/div/div/div/section/article/div[4]/button[2]
    BuiltIn.sleep  5s

Reset Password
    Click Link  //*[@id="app"]/div/div/div/section/div[2]/section/p[2]/a
    BuiltIn.sleep  2s
    Input Text  //*[@id="emailId"]  megha.nimbargimath@shenzyn.com
    BuiltIn.sleep  2s
    Click Button  //*[@id="app"]/div/div/div/section/div[2]/section/form/div[2]/div/div/span/button
    BuiltIn.sleep  3s

Add Recruiter
    Click Button  //html/body/div/div/div/section/section/section/main/div/div/div[1]/section/div[3]/button[3]
    BuiltIn.sleep  3s
    Click Button  //html/body/div/div/div/section/section/section/main/div/div/div[2]/div[3]/div[2]/div/div[2]/button
    BuiltIn.sleep  3s
    Click Element   //html/body/div[2]/div/div[2]/div/div[2]/div/section/form/div[1]/div[2]/div/span/span/div/span
    BuiltIn.sleep  3s
    pyautogui.typewrite    ${IMAGE_FILE_PATH}
    BuiltIn.sleep  3s
    ImageHorizonLibrary.Press Combination   Key.enter
    BuiltIn.sleep  3s
    Input Text  //*[@id="name"]  Megha
    BuiltIn.sleep  3s
    Input Text  //*[@id="mail"]  mnimbargimath@gmail.com
    BuiltIn.sleep  3s
    Input Text   //html/body/div[2]/div/div[2]/div/div[2]/div/section/form/div[5]/div[2]/div/span/div/div/div/ul/li/div/input  +91
    BuiltIn.sleep  3s
    Input Text  //*[@id="contactno"]  8861452547
    BuiltIn.sleep  3s
    Input Text  //*[@id="address"]  501,HSR Layout,1st phase.
    BuiltIn.sleep  3s
    Input Text  //*[@id="linkedin"]  https://www.linkedin.com/in/megha-nimbargimath-63a119152/
    BuiltIn.sleep  3s
    Input Text  //*[@id="location"]  Banglore
    BuiltIn.sleep  3s
    Click Button  //html/body/div[2]/div/div[2]/div/div[2]/div/section/form/div[10]/div/div/span/button
    BuiltIn.sleep  3s

Reset recruiter password
    Click Link  //*[@id="app"]/div/div/div/section/div[2]/section/p[2]/a
    BuiltIn.sleep  2s
    Input Text  //*[@id="emailId"]  megha.nimbargimath@shenzyn.com
    BuiltIn.sleep  2s
    Click Button  //*[@id="app"]/div/div/div/section/div[2]/section/form/div[2]/div/div/span/button
    BuiltIn.sleep  3s

Login as Admin
    Input Text  //*[@id="emailId"]  mnimbargimath@gmail.com
    BuiltIn.sleep  3s
    Input Password  //*[@id="password"]  Shenzyn1234
    BuiltIn.sleep  3s
    Click Button  //html/body/div/div/div/div/div/section/div[2]/section/form/div[4]/div/div/span/button
    BuiltIn.sleep  5s

Search Profiles
    Input Text  xpath=/html/body/div/div/div/section/section/div/header/div/div[2]/li/div/span/input  Java
    BuiltIn.sleep  3s
    Input Text  xpath=/html/body/div/div/div/section/section/div/header/div/div[2]/li/div/span/div/div/div/ul/li/div/input  Banglore
    BuiltIn.sleep  3s
    Click Button  xpath=/html/body/div/div/div/section/section/div/header/div/div[2]/li/div/span/button
    BuiltIn.sleep  5s

Post a Job
#Job Detailes
    set selenium speed  1s
    Click Button  //html/body/div/div/div/section/section/section/main/div/div/div[1]/section/div[3]/button[1]
    BuiltIn.sleep  3s
    Click Button  //html/body/div/div/div/section/section/section/main/div/div/div/div/div/div/div/div/div/section/article/div[2]/div/section/form/div[1]/div[2]/div/span/div[2]/div/div/span/span/div[1]/span/button
    BuiltIn.sleep  3s
    pyautogui.typewrite   ${Video_JD}
    BuiltIn.sleep  3s
    ImageHorizonLibrary.Press Combination   Key.enter
    BuiltIn.sleep  3s
    Input Text  //*[@id="jobtitle"]  QA Engineer
    BuiltIn.sleep  3s
    Input Text  //html/body/div/div/div/section/section/section/main/div/div/div/div/div/div/div/div/div/section/article/div[2]/div/section/form/div[3]/div[2]/div/span/div/div[2]/div/div[1]   Abce
    BuiltIn.sleep  3s
    Input Text  //*[@id="positions"]   20
    BuiltIn.sleep  3s
    Input Text  //*[@id="minsalary"]  4
    BuiltIn.sleep  3s
    Input Text  //*[@id="maxsalary"]  6
    BuiltIn.sleep  3s
    Select Checkbox  //*[@id="hidesalary"]
    BuiltIn.sleep  3s
    Input Text  //*[@id="otherbenefits"]  Null
    BuiltIn.sleep  3s
    input text  //*[@id="joblocation"]/div/div/ul/li/div/input     Bangalore
    BuiltIn.sleep  2s
    ImageHorizonLibrary.Press Combination   Key.enter
    BuiltIn.sleep  2s
    Click Button  //*[@id="app-content"]/div/div/div/div/div/div/div/div/div/section/article/div[5]/button
    BuiltIn.sleep  3s


    #Candidate Detailes
    Input Text  //*[@id="minexp"]  2
    BuiltIn.sleep  3s
    Input Text  //*[@id="maxexp"]  5
    BuiltIn.sleep  3s
    Input Text  //*[@id="functionalArea"]/div/div/ul/li/div/input  Engineering
    BuiltIn.sleep  3s
    ImageHorizonLibrary.Press Combination   Key.enter
    BuiltIn.sleep  3s
    Input Text  //*[@id="np"]  45
    BuiltIn.sleep  3s
    click element    (//div[@class='ant-select-selection__rendered'])[3]
    builtin.sleep    2s
    ImageHorizonLibrary.Press Combination   Key.backspace
    builtin.sleep    1s
    pyautogui.typewrite    Testing
    BuiltIn.sleep  3s
    ImageHorizonLibrary.Press Combination   Key.enter
    builtin.sleep    1s
    ImageHorizonLibrary.press combination    key.tab
    BuiltIn.sleep  3s
    pyautogui.typewrite    English
    BuiltIn.sleep  1s
    ImageHorizonLibrary.Press Combination   Key.enter
    builtin.sleep    1s
    ImageHorizonLibrary.Press Combination   Key.tab
    BuiltIn.sleep  3s
    Click Button  //*[@id="app-content"]/div/div/div/div/div/div/div/div/div/section/article/div[5]/button[2]
    BuiltIn.sleep  3s

    #Education Detailes
    click element   (//div[@class='ant-select-selection__rendered'])[2]
    builtin.sleep    1s
    pyautogui.typewrite    Post Graduation
    builtin.sleep    1s
    ImageHorizonLibrary.Press Combination   Key.enter
    builtin.sleep    1s
    ImageHorizonLibrary.press combination    key.tab
    builtin.sleep    1s
    pyautogui.typewrite    M.B.A
    BuiltIn.sleep  3s
    ImageHorizonLibrary.press combination    key.tab
    builtin.sleep    1s
    builtin.sleep    1s
    pyautogui.typewrite    Null
    BuiltIn.sleep  3s
    ImageHorizonLibrary.Press Combination   Key.enter
    BuiltIn.sleep  3s
    Click Button  //*[@id="app-content"]/div/div/div/div/div/div/div/div/div/section/article/div[5]/button[2]
    BuiltIn.sleep  3s

    #Manage Response
    Input Text  //*[@id="recipient"]  mnimbargimath@gmail.com
    BuiltIn.sleep  3s
    Input Text  //*[@id="forward"]  megha.nimbargimath@shenzyn.com
    BuiltIn.sleep  3s
    Click Button  //html/body/div[1]/div/div/section/section/section/main/div/div/div/div/div/div/div/div/div/section/article/div[5]/button[2]
    BuiltIn.sleep  3s


Approve Event
    Click Button     //html/body/div/div/div/section/section/section/main/div/div/div[1]/section/div[3]/button[2]
    BuiltIn.sleep    5s
    Click element   xpath=//i[@class ='anticon anticon-check-square-o']
    BuiltIn.sleep    8s
    click button    //button[.//text() = 'Approve']
    BuiltIn.sleep    5s

Approve Job
    Click element  xpath=//i[@class ='anticon anticon-check-square-o']
    BuiltIn.sleep  5s
    Click Button  //*[@id="app-content"]/div/div/div/div/div/div/div/div/div/section/article/div[5]/button
    BuiltIn.sleep  5s
    Click Button  //*[@id="app-content"]/div/div/div/div/div/div/div/div/div/section/article/div[5]/button[2]
    BuiltIn.sleep  5s
    Click Button  //*[@id="app-content"]/div/div/div/div/div/div/div/div/div/section/article/div[5]/button[2]
    BuiltIn.sleep  5s
    Click button  //*[@id="app-content"]/div/div/div/div/div/div/div/div/div/section/article/div[5]/button[2]
    BuiltIn.sleep  7s


