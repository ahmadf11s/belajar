*** Settings ***
Library     SeleniumLibrary     timeout=10

*** Variable ***
${userBtn}                   xpath://*[@id="__next"]/header/div/div[1]/div[3]/div/a[2]/img
${txtEmail}                  id:email
${txtPassword}               xpath://*[@id="__next"]/div/div/div/div/div[2]/div/form/div[2]/div/label/input
${loginBtn}                  xpath://*[@id="__next"]/div/div/div/div/div[2]/div/form/button
${msgErrEmailNotRegister}    xpath://span[contains(text(),'Email harus diisi dengan benar')]
${msgErrEmail}               xpath://*[@id="__next"]/div/div/div/div/div[2]/div/form/div[1]/div/div
${msgErrPassword}            xpath://*[@id="__next"]/div/div/div/div/div[2]/div/form/div[2]/div/div
${msgErrLupaPass}            xpath://*[@id="__next"]/div/div/div/div/div[2]/div/form/div[1]/div/div/div/div
${lanjutBtn}                 xpath://*[@id="__next"]/div/div/div/div/div[2]/div/form/button
${iconProfile}               id=popover-profile
${logoutBtn}                 xpath://*[@id="popover-profile"]/div[2]/div/a[3]

*** Keywords ***
Click Account Button
    Click Element           ${userBtn}

Input Email
    [Arguments]    ${email}
    Wait Until Page Contains Element    ${txtEmail}
    Input Text                          ${txtEmail}        ${email}

Input Password
    [Arguments]    ${pwd}
    Wait Until Page Contains Element    ${txtPassword}
    Input Text                          ${txtPassword}     ${pwd}

Click Login Button
    Click Element                       ${loginBtn} 

Verify Error Message Email Unregister
    Wait Until Page Contains Element    ${msgErrEmailNotRegister}
    Element Should Be Visible           ${msgErrEmailNotRegister}
    ${response}=       Get Text         ${msgErrEmailNotRegister}
    Should Be Equal As Strings          ${response}     Email harus diisi dengan benar                

Verify Error Message Email is Required
    Wait Until Page Contains ELement    ${msgErrEmail}
    Element Should Be Visible           ${msgErrEmail}
    ${response}=       Get Text         ${msgErrEmail}
    Should Be Equal As Strings          ${response}     Alamat Email wajib diisi   

Verify Error Message Password is Required
    Wait Until Page Contains ELement    ${msgErrPassword}
    Element Should Be Visible           ${msgErrPassword}
    ${response}=       Get Text         ${msgErrPassword}
    Should Be Equal As Strings          ${response}     Password wajib diisi

Verify Error Message Invalid Format Email
    Wait Until Page Contains ELement    ${msgErrEmail}
    Element Should Be Visible           ${msgErrEmail}
    ${response}=       Get Text         ${msgErrEmail}
    Should Be Equal As Strings          ${response}     Email harus diisi dengan benar

Verify Error Message Minimal Password
    Wait Until Page Contains ELement    ${msgErrPassword}  
    Element Should Be Visible           ${msgErrPassword}  
    ${response}=       Get Text         ${msgErrPassword}  
    Should Be Equal As Strings          ${response}     Password harus diisi minimal 6

Input Email Forgot Password
    [Arguments]    ${emailForgot}
    Wait Until Page Contains Element    ${txtEmail}  
    Input Text                          ${txtEmail}    ${emailForgot}

Clear Email Forgot Password
    Press Keys          ${txtEmail}     BACKSPACE    

Verify Error Message Invalid Format Email on Forgot Password
    Wait Until Page Contains ELement    ${msgErrLupaPass} 
    Element Should Be Visible           ${msgErrLupaPass} 
    ${response}=       Get Text         ${msgErrLupaPass} 
    Should Be Equal As Strings          ${response}     Isi alamat email dengan benar.

Verify Error Message Email is Required on Forgot Password
    Wait Until Page Contains ELement    ${msgErrLupaPass} 
    Element Should Be Visible           ${msgErrLupaPass} 
    ${response}=       Get Text         ${msgErrLupaPass} 
    Should Be Equal As Strings          ${response}     Alamat Email wajib diisi

Click Lanjut Button
    Click Element                       ${lanjutBtn}

Verify Login Success
    Wait Until Page Contains Element    ${iconProfile}   
    Element Should Be Visible           ${iconProfile}  

Logout Success
    Click Element                       ${iconProfile}
    Wait Until Page Contains Element    ${logoutBtn}
    Click Element                       ${logoutBtn}    