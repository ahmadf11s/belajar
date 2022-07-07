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

Login with Empty Email and Password
    go to                      ${globalURL}
    Click Account Button
    Click Login Button
    PageLogin.Verify Error Message Email is Required
    PageLogin.Verify Error Message Password is Required