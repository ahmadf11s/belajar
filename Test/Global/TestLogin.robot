*** Settings ***
Library     SeleniumLibrary
Resource    ../../PageObject/PageLogin.robot
Resource    ../../Variables/var.robot

*** Keywords ***
Login with Email Unregister
    [Arguments]    ${email}    ${pwd}
    Click Account Button
    PageLogin.Input Email           ${email}
    PageLogin.Input Password        ${pwd}
    Click Login Button
    PageLogin.Verify Error Message Email Unregister