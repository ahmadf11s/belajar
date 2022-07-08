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

Login with Invalid Format Email
    [Arguments]    ${email}    ${pwd}
    go to          ${globalURL}
    Click Account Button
    PageLogin.Input Email           ${email}
    PageLogin.Input Password        ${pwd}
    Click Login Button
    PageLogin.Verify Error Message Invalid Format Email

Login with Minimum Password
    [Arguments]    ${email}    ${pwd}
    go to          ${globalURL}
    Click Account Button
    PageLogin.Input Email           ${email}
    PageLogin.Input Password        ${pwd}
    PageLogin.Verify Error Message Minimal Password

Forgot Password with Invalid Format Email
    [Arguments]    ${email}    
    go to          ${forgotURL}
    PageLogin.Input Email Forgot Password       ${email}
    PageLogin.Verify Error Message Invalid Format Email on Forgot Password

Forgot Password with Empty Email
    [Arguments]    ${emailForgot}    
    go to          ${forgotURL}
    PageLogin.Input Email Forgot Password       ${emailForgot}
    Clear Email Forgot Password           
    PageLogin.Verify Error Message Email is Required on Forgot Password

Login Success with Email
    [Arguments]    ${email}    ${pwd}    
    Click Account Button
    PageLogin.Input Email           ${email}
    PageLogin.Input Password        ${pwd}
    Click Login Button
    PageLogin.Verify Account