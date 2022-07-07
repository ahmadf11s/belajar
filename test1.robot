*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
First Test
    Open Browser    http://google.com    chrome
    Sleep    3s
    Close Browser
    
