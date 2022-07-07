*** Settings ***
Library     SeleniumLibrary     timeout=10

*** Variable ***
${userBtn}                   xpath://*[@id="__next"]/header/div/div[1]/div[3]/div/a[2]/img
${txtEmail}                  id:email
${txtPassword}               xpath://*[@id="__next"]/div/div/div/div/div[2]/div/form/div[2]/div/label/input
${loginBtn}                  xpath://*[@id="__next"]/div/div/div/div/div[2]/div/form/button
${msgErrEmailNotRegister}    xpath://span[contains(text(),'Email harus diisi dengan benar')]
${msgErrEmailIsRequired}     xpath://*[@id="__next"]/div/div/div/div/div[2]/div/form/div[1]/div/div
${msgErrPasswordIsRequired}  xpath://*[@id="__next"]/div/div/div/div/div[2]/div/form/div[2]/div/div

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
    Wait Until Page Contains ELement    ${msgErrEmailIsRequired}
    Element Should Be Visible           ${msgErrEmailIsRequired}
    ${response}=       Get Text         ${msgErrEmailIsRequired}
    Should Be Equal As Strings          ${response}     Alamat Email wajib diisi   

Verify Error Message Password is Required
    Wait Until Page Contains ELement    ${msgErrPasswordIsRequired}
    Element Should Be Visible           ${msgErrPasswordIsRequired}
    ${response}=       Get Text         ${msgErrPasswordIsRequired}
    Should Be Equal As Strings          ${response}     Password wajib diisi