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
${photoProfile}                 xpath://*[@id="logo-image"]
${txtGender}                    xpath://div[@id='gender']/div/button
${txtHeight}                    xpath://*[@id="__next"]/div[1]/div/div/div[2]/div[2]/div[2]/div/div/div[1]/div[4]/div/label/input
${txtWeight}                    xpath://*[@id="__next"]/div[1]/div/div/div[2]/div[2]/div[2]/div/div/div[1]/div[5]/div/label/input
${txtPhone}                     xpath://*[@id="__next"]/div[1]/div/div/div[2]/div[2]/div[2]/div/div/div[1]/div[6]/div/label/input
${txtAddress}                   id:address    
${verifikasiBtn}                xpath://*[@id="__next"]/div[1]/div/div/div[2]/div[2]/div[2]/div/div/div[2]/a

*** Keywords ***
Click Edit Profile Button
    Element Should Be Visible           ${editProfileBtn}
    Element Should Contain              ${editProfileBtn}     Edit Profil
    Click Element                       ${editProfileBtn}

Click Save Button on Profile
    Click Element                       ${simpanBtn}

Click Lihat Profil
    Element Should Be Visible           ${seeProfileBtn}
    Element Should Contain              ${seeProfileBtn}      Lihat Profil
    Click Element                       ${seeProfileBtn} 

Verify Error Message Birthday
    Wait Until Page Contains Element    ${msgErrBirthday}
    Element Should Be Visible           ${msgErrBirthday}
    ${response}=    Get Text            ${msgErrBirthday}
    Should Be Equal As Strings          ${response}           Tanggal Lahir wajib diisi

Verify Error Message Gender
    Wait Until Page Contains Element    ${msgErrGender} 
    Element Should Be Visible           ${msgErrGender} 
    ${response}=    Get Text            ${msgErrGender} 
    Should Be Equal As Strings          ${response}           Jenis kelamin wajib diisi
    
Verify Error Message Empty Height
    Wait Until Page Contains Element    ${msgErrHeight} 
    Element Should Be Visible           ${msgErrHeight} 
    ${response}=    Get Text            ${msgErrHeight} 
    Should Be Equal As Strings          ${response}           Tinggi Badan wajib diisi

Verify Error Message Invalid Height 
    Wait Until Page Contains Element    ${msgErrHeight} 
    Element Should Be Visible           ${msgErrHeight} 
    ${response}=    Get Text            ${msgErrHeight} 
    Should Be Equal As Strings          ${response}           Tinggi Badan harus diisi dengan benar
    Reload Page

Verify Error Message Minimal Height 
    Wait Until Page Contains Element    ${msgErrHeight} 
    Element Should Be Visible           ${msgErrHeight} 
    ${response}=    Get Text            ${msgErrHeight} 
    Should Be Equal As Strings          ${response}           Kolom Tinggi Badan minimal 2
    Reload Page

Verify Error Message Maximal Height 
    Wait Until Page Contains Element    ${msgErrHeight} 
    Element Should Be Visible           ${msgErrHeight} 
    ${response}=    Get Text            ${msgErrHeight} 
    Should Be Equal As Strings          ${response}           Kolom Tinggi Badan maksimal 3
    Reload Page

Verify Error Message Weight
    Wait Until Page Contains Element    ${msgErrWeight} 
    Element Should Be Visible           ${msgErrWeight} 
    ${response}=    Get Text            ${msgErrWeight} 
    Should Be Equal As Strings          ${response}           Berat Badan wajib diisi

Verify Error Message Invalid Weight
    Wait Until Page Contains Element    ${msgErrWeight} 
    Element Should Be Visible           ${msgErrWeight} 
    ${response}=    Get Text            ${msgErrWeight} 
    Should Be Equal As Strings          ${response}           Berat Badan harus diisi dengan benar

Verify Error Message Invalid Phone
    Wait Until Page Contains Element    ${txtPhone} 
    Element Should Be Visible           ${txtPhone} 
    ${response}=    Get Text            ${txtPhone} 
    Should Be Equal As Strings          ${response}           No. Telp harus diisi dengan benar

Verify Error Message Address
    Wait Until Page Contains Element    ${msgErrAddress}
    Element Should Be Visible           ${msgErrAddress}
    ${response}=    Get Text            ${msgErrAddress}
    Should Be Equal As Strings          ${response}           Alamat wajib diisi

Verify Error Message Minimal Address
    Wait Until Page Contains Element    ${msgErrAddress}
    Element Should Be Visible           ${msgErrAddress}
    ${response}=    Get Text            ${msgErrAddress}
    Should Be Equal As Strings          ${response}           Kolom Alamat minimal 3
    Reload Page

Verify Error Message Maximal Address
    Wait Until Page Contains Element    ${msgErrAddress}
    Element Should Be Visible           ${msgErrAddress}
    ${response}=    Get Text            ${msgErrAddress}
    Should Be Equal As Strings          ${response}           Kolom Alamat maksimal 256

Change Profile Picture
    [Arguments]     ${file}
    Choose File     ${photoProfile}     ${file}
    
Input Height Profile
    [Arguments]     ${height}
    Wait Until Page Contains Element    ${txtHeight}
    Input Text                          ${txtHeight}          ${height}

Input Weight Profile
    [Arguments]     ${weight}
    Wait Until Page Contains Element    ${txtWeight}
    Input Text                          ${txtWeight}          ${weight}

Input Phone Number Profile
    [Arguments]     ${phone}
    Reload Page
    Wait Until Page Contains Element    ${txtPhone}
    Input Text                          ${txtPhone}           ${phone}

Input Address Profile
    [Arguments]     ${address}
    Wait Until Page Contains Element    ${txtAddress}  
    Input Text                          ${txtAddress}         ${address}

Click Verifikasi Now
    Double Click Element                ${verifikasiBtn}

Verify Link Verification
    ${urlVerification}                  Get Location
    Should Match Regexp                 ${urlVerification}    https://www.sehatq.com/profil/884475/verifikasi

Clear Full Name Field on Edit Profile
    Reload Page
    Wait Until Page Contains Element    ${txtFullNameEdit}
    Element Should Be Visible           ${txtFullNameEdit}
    Clear Element Text                  ${txtFullNameEdit}