*** Variables ***
${REMOTE_URL}   https://www.sehatq.com/

*** Keywords ***
Open Local Browser
    [Arguments]     ${url}    ${browser}
    open browser    ${url}    ${browser}      
    maximize browser window