*** Settings ***
Library        Browser

*** Variables ***
${BROWSER}                     chromium

*** Keywords ***
Abrir o navegador
    New Browser    ${BROWSER}     headless=No     chromiumSandbox=On

Fechar o navegador
    Browser.Close Browser
