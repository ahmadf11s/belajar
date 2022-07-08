*** Settings ***
Library     SeleniumLibrary     timeout=15

*** Variable ***
${editProfileBtn}               xpath://A[@href='/profil/884475/detail/edit'][text()='Edit Profil']/self::A
${simpanBtn}                    xpath://*[@id="__next"]/div[1]/div/div/div[2]/div[2]/div[2]/div/div/div[3]
${seeProfileBtn}                xpath://*[@id="__next"]/div[1]/div/div/div[1]/div/div[1]/div/div/div[2]/a/span
${msgErrBirthday}               xpath://*[@id="__next"]/div[1]/div/div/div[2]/div[2]/div[2]/div/div/div[1]/div[2]/div/div/div
${msgErrGender}                 xpath://*[@id="gender"]/div[2]
${msgErrHeight}                 xpath://*[@id="__next"]/div[1]/div/div/div[2]/div[2]/div[2]/div/div/div[1]/div[4]/div/div
${msgErrWeight}                 xpath://*[@id="__next"]/div[1]/div/div/div[2]/div[2]/div[2]/div/div/div[1]/div[5]/div/div
${msgErrAddress}                xpath://*[@id="__next"]/div[1]/div/div/div[2]/div[2]/div[2]/div/div/div[1]/div[8]/div

*** Keywords ***
Click Edit Profile Button
    Element Should Be Visible     ${editProfileBtn}
    Element Should Contain        ${editProfileBtn}     Edit Profil
    Click Element       ${editProfileBtn}

Click Save Button on Profile
    Click Element       ${simpanBtn}

Click Lihat Profil
    Element Should Be Visible     ${seeProfileBtn}
    Element Should Contain        ${seeProfileBtn}      Lihat Profil
    Click Element       ${seeProfileBtn} 

Verify Error Message Birthday
    Wait Until Page Contains Element    ${msgErrBirthday}
    Element Should Be Visible           ${msgErrBirthday}
    ${response}=       Get Text         ${msgErrBirthday}
    Should Be Equal As Strings          ${response}      Tanggal Lahir wajib diisi

Verify Error Message Gender
    Wait Until Page Contains Element    ${msgErrGender} 
    Element Should Be Visible           ${msgErrGender} 
    ${response}=       Get Text         ${msgErrGender} 
    Should Be Equal As Strings          ${response}      Jenis kelamin wajib diisi
    
Verify Error Message Height
    Wait Until Page Contains Element    ${msgErrHeight} 
    Element Should Be Visible           ${msgErrHeight} 
    ${response}=       Get Text         ${msgErrHeight} 
    Should Be Equal As Strings          ${response}      Tinggi Badan wajib diisi

Verify Error Message Weight
    Wait Until Page Contains Element    ${msgErrWeight} 
    Element Should Be Visible           ${msgErrWeight} 
    ${response}=       Get Text         ${msgErrWeight} 
    Should Be Equal As Strings          ${response}      Berat Badan wajib diisi

Verify Error Message Address
    Wait Until Page Contains Element    ${msgErrAddress}
    Element Should Be Visible           ${msgErrAddress}
    ${response}=       Get Text         ${msgErrAddress}
    Should Be Equal As Strings          ${response}      Alamat wajib diisi