*** Settings ***
Library     SeleniumLibrary
Resource    ../../Variables/var.robot
Resource    ../../Config/config.robot
Resource    ../../Test/Global/TestLogin.robot
Resource    ../../Test/Global/TestRegister.robot
Resource    ../../Test/Global/TestSetting.robot

Suite Setup         Launch the Browser and Open sehatq.com
Suite Teardown      Close all browsers

*** Variable ***
${url}      https://www.sehatq.com/

*** Keywords ***
Launch the Browser and Open sehatq.com
    Open Local Browser      ${url}          headlesschrome
    Set Global Variable     ${globalURL}    ${url}

*** Test Case ***
Register with Invalid Full Name
    [Tags]    All   Register  Negative
    Register with Full Name other than Letters    69

Register with Empty Full Name
    [Tags]    All   Register  Negative
    Register with Empty Full Name        A

Register with Invalid Format Email
    [Tags]    All   Register  Negative
    Register with Invalid Format Email Register   dwa

Register with Empty Email
    [Tags]    All   Register  Negative
    Register with Empty Email       A

Register with Minimum Password Character
    [Tags]    All   Register  Negative
    Register with Minimum Password Character      123

Register with Empty Password
    [Tags]    All   Register  Negative
    Register with Empty Password    A

Register Success with Valid Data
    [Tags]    All   Register  Positive
    Register with Valid Data        ${nameSuccess}     ${emailRegisSuccess}     ${password}

Login with Unregistered Account
    [Tags]    All   Login     Negative
    Login with Email Unregister      ${email}         ${password}

Login with Empty Email and Password
    [Tags]    All   Login     Negative
    Login with Empty Email and Password

Login with Invalid Format Email
    [Tags]    All   Login     Negative
    Login with Invalid Format Email   hohoho          ${password}

Login with Minimum Charcter Password
    [Tags]    All   Login     Negative
    Login with Minimum Password       ${email}        123

Forgot Password with Invalid Format Email
    [Tags]    All   Forgot    Negative
    Forgot Password with Invalid Format Email         dwa    

Forgot Password with Empty Email
    [Tags]    All   Forgot    Negative
    Forgot Password with Empty Email  A

Login Success with Email
    [Tags]    All   Login1     Positive
    Login Success with Email          ${emailRegis}   ${password}

Logout Success
    [Tags]    All   Logout     Positive
    Logout Success

Access Edit Profile Page
    [Tags]    All   Setting    Positive
    Access Edit Profile Page

Edit Profile with Empty Birthday
    [Tags]    All   Setting    Negative
    Edit Profile with Empty Birthday    

Edit Profile with Empty Gender
    [Tags]    All   Setting    Negative
    Edit Profile with Empty Gender

Edit Profile with Empty Height
    [Tags]    All   Setting    Negative
    Edit Profile with Empty Height

Edit Profile with Empty Weight
    [Tags]    All   Setting    Negative
    Edit Profile with Empty Weight

Edit Profile with Empty Address
    [Tags]    All   Setting    Negative
    Edit Profile with Empty Address