*** Settings ***  
Documentation        keywords comuns a todos os scripts      
Resource   usuario.resource
Resource   produto.resource
Library    RequestsLibrary
Library    String

*** Keywords ***
Criar sessão na api
    ${HEADERS}     Create Dictionary        
    ...            accept=application/json        
    ...            Content-Type=application/json
    Create Session    alias=etapavaIV_api    url=https://serverest.dev    headers=${HEADERS}   disable_warnings=true

Criar sessão na api autenticada
    ${HEADERS}          Create Dictionary    Authorization=${MY_TOKEN}
    Create Session      alias=etapavaIV_api_auth  url=https://serverest.dev      headers=${HEADERS}     disable_warnings=True
