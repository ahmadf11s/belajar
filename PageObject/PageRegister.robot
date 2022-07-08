*** Settings ***
Library     SeleniumLibrary     timeout=10

*** Variable ***
${txtFullName}               id:name
${txtEmail}                  id:email
${txtPwd}                    xpath://*[@id="__next"]/div/div/div/div/div[2]/div/form/div[3]/div/label/input
${checkboxAgree}             xpath://*[@id="__next"]/div/div/div/div/div[2]/div/form/div[4]/div/div/label/span/span
${daftarBtn}                 xpath://*[@id="__next"]/div/div/div/div/div[2]/div/form/button
${msgErrFullName}            xpath://*[@id="__next"]/div/div/div/div/div[2]/div/form/div[1]/div/div
${msgErrEm}                  xpath://*[@id="__next"]/div/div/div/div/div[2]/div/form/div[2]/div/div
${msgErrPwd}                 xpath://*[@id="__next"]/div/div/div/div/div[2]/div/form/div[3]/div/div

*** Keywords ***
Input Full Name
    [Arguments]    ${name}
    Wait Until Page Contains Element    ${txtFullName} 
    Input Text                          ${txtFullName}  ${name}

Input Email
    [Arguments]    ${email}
    Wait Until Page Contains Element    ${txtEmail}
    Input Text                          ${txtEmail}     ${email}

Input Password
    [Arguments]    ${pwd}
    Wait Until Page Contains Element    ${txtPwd}
    Input Text                          ${txtPwd}       ${pwd}

Select Checkbox Agreement
    Click Element                       ${checkboxAgree}

Click Register Button
    Click Element                       ${daftarBtn}    

Verify Error Message Full Name
    Wait Until Page Contains ELement    ${msgErrFullName}  
    Element Should Be Visible           ${msgErrFullName}  
    ${response}=       Get Text         ${msgErrFullName}  
    Should Be Equal As Strings          ${response}     Nama lengkap harus diisi dengan huruf.

Clear Full Name when Register
    Press Keys         ${txtFullName}   BACKSPACE

Verify Error Message Full Name is Required
    Wait Until Page Contains ELement    ${msgErrFullName}  
    Element Should Be Visible           ${msgErrFullName}  
    ${response}=       Get Text         ${msgErrFullName}  
    Should Be Equal As Strings          ${response}     Nama Lengkap wajib diisi

Verify Error Message Invalid Format Email when Register
    Wait Until Page Contains ELement    ${msgErrEm}        
    Element Should Be Visible           ${msgErrEm}        
    ${response}=       Get Text         ${msgErrEm}        
    Should Be Equal As Strings          ${response}     Email harus diisi dengan benar.

Clear Email when Register
    Press Keys         ${txtEmail}      BACKSPACE

Verify Error Message Email is Required when Register
    Wait Until Page Contains ELement    ${msgErrEm}
    Element Should Be Visible           ${msgErrEm}
    ${response}=       Get Text         ${msgErrEm}
    Should Be Equal As Strings          ${response}     Email wajib diisi

Verify Error Message Minimal Password when Register
    Wait Until Page Contains ELement    ${msgErrPwd}  
    Element Should Be Visible           ${msgErrPwd}  
    ${response}=       Get Text         ${msgErrPwd}  
    Should Be Equal As Strings          ${response}     Password harus diisi minimal 6
    
Clear Password when Register
    Press Keys         ${txtPwd}        BACKSPACE

Verify Error Message Password is Required
    Wait Until Page Contains ELement    ${msgErrPwd}
    Element Should Be Visible           ${msgErrPwd}
    ${response}=       Get Text         ${msgErrPwd}
    Should Be Equal As Strings          ${response}     Password wajib diisi