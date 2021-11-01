*** Test Cases ***

Open Application and fail
    Log to Console    About to Fail
    Fail
    Log to Console    Will never trigger.
    [Teardown]    Generic Test Case Teardown

Open Application and Pass
    Log to Console    About to Pass
    No Operation
    Log to Console    Will trigger.
    [Teardown]    Generic Test Case Teardown

*** Keywords ***
Generic Test Case Teardown
    # Catch of Try Catch Finally
    Run Keyword If Test Failed    Test Case Catch

    # Finally of Try Catch Finally
    #  RKITS is only executed when test passed.
    Run Keyword If Test Passed    Test Case Finally
    #  Always executed regardless of test execution status.
    Log To Console     I am always executed.

Test Case Catch
    Log To Console    Test Case Catch

Test Case Finally
    Log To Console    Test Case Finally
