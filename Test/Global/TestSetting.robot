*** Settings ***
Library     SeleniumLibrary
Resource    ../../PageObject/PageSetting.robot
Resource    ../../Test/Global/TestLogin.robot
Resource    ../../Variables/var.robot

*** Keywords ***
Access Edit Profile Page
    Login Success with Email    ${emailRegis}     ${password} 
    go to                       ${profileURL}
    ${urlProfile}               Get Location
    Should Match Regexp         ${urlProfile}             https://www.sehatq.com/profil
    Click Lihat Profil 
    Click Edit Profile Button
    Click Save Button on Profile

Edit Profile with Empty Birthday
    PageSetting.Verify Error Message Birthday

Edit Profile with Empty Gender
    PageSetting.Verify Error Message Gender

Edit Profile with Empty Height
    PageSetting.Verify Error Message Empty Height

Edit Profile with Empty Weight
    PageSetting.Verify Error Message Weight

Edit Profile with Empty Address
    PageSetting.Verify Error Message Address

Change Photo Profile
    [Arguments]     ${file}
    PageSetting.Change Profile Picture         ${file}

Edit Profile with Invalid Height
    [Arguments]    ${height}
    Input Height Profile          ${height}
    PageSetting.Verify Error Message Invalid Height 

Edit Profile with Minimal Height
    [Arguments]    ${height}
    Input Height Profile          ${height}
    PageSetting.Verify Error Message Minimal Height 

Edit Profile with Maximal Height
    [Arguments]    ${height}
    Input Height Profile          ${height}
    PageSetting.Verify Error Message Maximal Height 

Edit Profile with Invalid Weight
    [Arguments]    ${weight}
    Input Weight Profile          ${weight}
    PageSetting.Verify Error Message Invalid Weight

Edit Profile with Invalid Phone Number
    [Arguments]    ${phone}
    Input Phone Number Profile    ${phone}
    # PageSetting.Verify Error Message Invalid Phone

Edit Profile with Minimal Address Profile
    [Arguments]    ${address}
    Input Address Profile         ${address}
    PageSetting.Verify Error Message Minimal Address

Edit Profile with Maximal Address Profile
    [Arguments]    ${address}
    Input Address Profile         ${address}
    PageSetting.Verify Error Message Maximal Address

Input Height
    [Arguments]    ${height}
    PageSetting.Input Height Profile          ${height}

Input Weight
    [Arguments]    ${weight}
    PageSetting.Input Weight Profile          ${weight}

Input Phone Number
    [Arguments]    ${phone}
    PageSetting.Input Phone Number Profile    ${phone}

Input Address 
    [Arguments]    ${address}
    PageSetting.Input Address Profile         ${address}

Verifikasi Now
    Reload Page
    Click Verifikasi Now
    PageSetting.Verify Link Verification