*** Settings ***
Library    SeleniumLibrary
Documentation  This is a testcase for partner subscription
#Resource    ../Resources/PO/HiringPartner_PO/CommonFunctionality.robot
#Resource    ../Resources/PO/HiringPartner_PO/UserDefinedkeywords.robot
#
#
#*** Test Cases ***
#Test subscription
#    Start testcase
#    Login details for sub
#    Subscription
#    End testcase

*** Keywords ***
Login details for sub
    wait until element is visible    //*[@id="emailId"]    timeout=120s
    input text   //*[@id="emailId"]     sharanyakotholla11@gmail.com
    input text  //*[@id="password"]     She@1234
    click button    //*[@id="app"]/div/div/div/section/div[2]/section/form/div[4]/div/div/span/button

Subscription
    set selenium speed    0.5
    wait until element is visible    //header/div[1]/div[2]/div[1]/a[1]    timeout=120s
    click link  //header/div[1]/div[2]/div[1]/a[1]
    wait until element is visible    //i[@class ='anticon anticon-pay-circle-o']    timeout=120s
    click element   xpath=//i[@class ='anticon anticon-pay-circle-o']
    wait until element is visible   //button[@class='ant-btn ant-btn-submit']    timeout=120s
    log to console    reached here.....
    click button    (//button[@class='ant-btn ant-btn-submit'])[1]
    log to console    Buy button located.

    #Validating toast messages
    wait until element is visible    //span[contains(text(),'You have already subscribed valid Plans')]    timeout=120s
    ${message}=    get text    //span[contains(text(),'You have already subscribed valid Plans')]
    #Testing the text present on the toast message
    should be equal    ${message}    You have already subscribed valid Plans

#    The below script will be activated if we've a new partner opting for subscription
#    wait until element is visible    (//h2)[2]    timeout=120s
#    click element    (//h2)[2]
#    wait until element is visible    //*[@id="CardNumber1"]    timeout=120s
#    input text   //*[@id="CardNumber1"]      4444333322221111
#    input text   //*[@id="CardHolderName1"]      Test
#    input text   //*[@id="CardDate1"]        0723
#    input text   //*[@id="CVVFormatter1"]        123
#    wait until element is visible    //div[9]/div/button    timeout=120s
#    click button    //div[9]/div/button
#    log to console    Subscription Validated Successsfully.
#    log   Subscription Validated Successsfully.



