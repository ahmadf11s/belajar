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
    [Tags]    Login    Negative
    Login with Email Unregister      ${email}      ${password}