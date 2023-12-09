*** Settings ***
Resource    produto.resource
Resource    commom.resource
Library    RequestsLibrary
Library    String
Library    Collections



*** Keywords ***

Criar um novo usuario
    ${RANDOM_USER}    Generate Random String    length=5    chars=[LETTERS]
    Set Test Variable        ${USER_EMAIL}       ${RANDOM_USER}@emailteste.com 
    ${USER_EMAIL}    Convert To Lower Case        ${USER_EMAIL}
    Log       ${USER_EMAIL}   

Cadastrar o usuario criado na api
    [Arguments]        ${USER_EMAIL}    ${STATUS_CODE_EXPEC}
    ${BODY_SINGUP_USER}    Create Dictionary
    ...            nome=Tony stark    
    ...            email=${USER_EMAIL}  
    ...            password=1234    
    ...            administrador=true
   
    Criar sessão na api
   
    ${RESPONSE}    POST On Session        
    ...            alias=etapavaIV_api    
    ...            url=/usuarios        
    ...            json=${BODY_SINGUP_USER}     
    ...            expected_status=${STATUS_CODE_EXPEC}

    Log    ${RESPONSE.json()}
    Set Test Variable     ${ID_USER}         ${RESPONSE.json()["_id"]}
    Set Test Variable     ${RESPONSE}       ${RESPONSE.json()}

Validar o usuário está cadastrado com sucesso
    Log     ${RESPONSE}
    Dictionary Should Contain Item    dictionary=${RESPONSE}    key=message    value=Cadastro realizado com sucesso
    Dictionary Should Contain Key        dictionary=${RESPONSE}    key=_id

Buscar usuário cadastrado
    ${RESPONSE_SEARCH_USER}    GET On Session    alias=etapavaIV_api    url=/usuarios/${ID_USER}    expected_status=200
    Set Test Variable    ${RESPONSE_SEARCH_USER}    ${RESPONSE_SEARCH_USER.json()}

Validar usuário retornado
    Log    ${RESPONSE_SEARCH_USER}
    Dictionary Should Contain Item    dictionary=${RESPONSE_SEARCH_USER}    key=nome            value=Tony stark
    Dictionary Should Contain Item    dictionary=${RESPONSE_SEARCH_USER}    key=email           value=${USER_EMAIL}  
    Dictionary Should Contain Item    dictionary=${RESPONSE_SEARCH_USER}    key=password        value=1234
    Dictionary Should Contain Item    dictionary=${RESPONSE_SEARCH_USER}    key=administrador   value=true
    Dictionary Should Contain Item    dictionary=${RESPONSE_SEARCH_USER}    key=_id              value=${ID_USER}   

Realizar login do usuario
    ${body}  Create Dictionary
    ...      email=${USER_EMAIL}  
    ...      password=1234  
    
    Criar sessão na api

    ${RESPONSE_TOKEN}  POST On Session
    ...          alias=etapavaIV_api 
    ...          url=/login
    ...          json=${body}
    ...          expected_status=200
    
    Log    ${RESPONSE_TOKEN}

    Set Test Variable    ${MY_TOKEN}   ${RESPONSE_TOKEN.json()["authorization"]}
    Set Test Variable    ${RESPONSE_TOKEN}    ${RESPONSE_TOKEN.json()} 

#GK

Dado que foi criado um novo usuario
    Criar um novo usuario

Quando cadastrar o usuário na api
    Cadastrar o usuario criado na api    USER_EMAIL=${USER_EMAIL}    STATUS_CODE_EXPEC=201

Então esse usuário deve ser cadastrado com sucesso
    Validar o usuário está cadastrado com sucesso

e Autenticar esse usuario
    Realizar login do usuario
    
e Pesquisar pelo usuário cadastrado
    Buscar usuário cadastrado



Entao o usuário pesquisado deve ser o mesmo cadastrado
    Validar usuário retornado