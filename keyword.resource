*** Settings ***
Library              SeleniumLibrary
Library              CustomLib.py

*** Variables ***
${url}               https://github.com
${browser}           Chrome

*** Keywords ***
Preparation
    Set Log Level    NONE
    ${config}        Read Configuration
    Set Global Variable    ${CONFIG}
    Set Log Level    INFO

Processing
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Sleep            3s
    Login Github

Login Github
    Click Link                       //a[@href='/login']
    Wait Until Element Is Enabled    //*[contains(text(),'Sign in to GitHub')]
    Input Text                       //input[@id='login_field']    ${CONFIG["username"]}
    Input Text                       //input[@id='password']       ${CONFIG["password"]}
    Click Button                     //input[@name='commit']
    Sleep            5s

Closing
    Close All Browsers
