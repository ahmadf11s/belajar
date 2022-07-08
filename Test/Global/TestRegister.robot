*** Settings ***
Library     SeleniumLibrary
Resource    ../../PageObject/PageRegister.robot
Resource    ../../PageObject/PageLogin.robot
Resource    ../../Variables/var.robot

*** Keywords ***
Register with Full Name other than Letters
    [Arguments]    ${name} 
    go to          ${registerURL}
    PageRegister.Input Full Name   ${name}
    PageRegister.Verify Error Message Full Name

Register with Empty Full Name
    [Arguments]    ${nameRegister}    
    go to          ${registerURL}
    PageRegister.Input Full Name     ${nameRegister}   
    Clear Full Name when Register          
    PageRegister.Verify Error Message Full Name is Required

Register with Invalid Format Email Register
    [Arguments]    ${email}    
    go to          ${registerURL}
    PageRegister.Input Email         ${email}            
    PageRegister.Verify Error Message Invalid Format Email when Register

Register with Empty Email
    [Arguments]    ${email}    
    go to          ${registerURL}
    PageRegister.Input Email         ${email}   
    Clear Email when Register         
    PageRegister.Verify Error Message Email is Required when Register

Register with Minimum Password Character
    [Arguments]    ${pwd}
    go to          ${registerURL}
    PageRegister.Input Password      ${pwd}
    PageRegister.Verify Error Message Minimal Password when Register

Register with Empty Password
    [Arguments]    ${pwd}
    go to          ${registerURL}
    PageRegister.Input Password      ${pwd}
    Clear Password when Register
    PageRegister.Verify Error Message Password is Required

Register with Valid Data
    [Arguments]    ${nameRegister}   ${email}    ${pwd}
    go to          ${registerURL}
    PageRegister.Input Full Name     ${nameRegister} 
    PageRegister.Input Email         ${email}
    PageRegister.Input Password      ${pwd}
    Select Checkbox Agreement
    Click Register Button
    PageLogin.Verify Account