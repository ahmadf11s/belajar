*** Settings ***
Library     SeleniumLibrary
Resource    ../../Variables/var.robot
Resource    ../../Config/config.robot
Resource    ../../Test/Global/TestLogin.robot

Suite Setup         Launch the Browser and Open sehatq.com
Suite Teardown      Close all browsers

*** Variable ***
${url}      https://www.sehatq.com/

*** Keywords ***
Launch the Browser and Open sehatq.com
    Open Local Browser      ${url}          headlesschrome
    Set Global Variable     ${globalURL}    ${url}

*** Test Case ***
Login with Unregistered Account
    [Tags]    All   Login     Negative
    Login with Email Unregister      ${email}     ${password}

Login with Empty Email and Password
    [Tags]    All   Login     Negative
    Login with Empty Email and Password

Login with Invalid Format Email
    [Tags]    All   Login     Negative
    Login with Invalid Format Email   hohoho      ${password}

Login with Minimum Charcter Password
    [Tags]    All   Login     Negative
    Login with Minimum Password       ${email}    123

Forgot Password with Invalid Format Email
    [Tags]    All   Forgot    Negative
    Forgot Password with Invalid Format Email     dwa    

Forgot Password with Empty Email
    [Tags]    All   Forgot    Negative
    Forgot Password with Empty Email  A

Login Success with Email
    [Tags]    All   Login     Positive    coba
    Login Success with Email          ${emailRegis}    ${password}

Logout Success
    [Tags]    All   Logout     Positive    coba
    Logout Success