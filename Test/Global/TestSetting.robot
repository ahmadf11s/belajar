*** Settings ***
Library     SeleniumLibrary
Resource    ../../PageObject/PageSetting.robot
Resource    ../../Test/Global/TestLogin.robot
Resource    ../../Variables/var.robot

*** Keywords ***
Access Edit Profile Page
    Login Success with Email       ${emailRegis}     ${password} 
    go to                    ${profileURL}
    ${urlProfile}          Get Location
    Should Match Regexp    ${urlProfile}     https://www.sehatq.com/profil
    Click Lihat Profil 
    Click Edit Profile Button
    Click Save Button on Profile

Edit Profile with Empty Birthday
    PageSetting.Verify Error Message Birthday

Edit Profile with Empty Gender
    PageSetting.Verify Error Message Gender

Edit Profile with Empty Height
    PageSetting.Verify Error Message Height

Edit Profile with Empty Weight
    PageSetting.Verify Error Message Weight

Edit Profile with Empty Address
    PageSetting.Verify Error Message Address