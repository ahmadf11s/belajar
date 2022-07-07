*** Variables ***
#${url}  https://kitabisa.xyz
${REMOTE_URL}   https://www.sehatq.com/


*** Keywords ***
Open Local Browser
    [Arguments]     ${url}    ${browser}
    open browser    ${url}    ${browser}      
    maximize browser window

# Open The Browser
#     [Arguments]     ${url}    ${browser}
#     open browser    ${url}
#     ...  remote_url=${REMOTE_URL}
#     ...  desired_capabilities=browserName:${browser},idleTimeout:150
#     maximize browser window