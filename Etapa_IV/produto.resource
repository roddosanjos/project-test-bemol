*** Settings ***
Resource    commom.resource
Library    RequestsLibrary
Library    String
Library    Collections



*** Keywords ***
Criar um novo produto
    ${RANDOM_PRODUCT}      Generate Random String        length=5    chars=[NUMBERS]
    Set Test Variable        ${PRODUCT_NOME}       PRODUTINHO-${RANDOM_PRODUCT} 

Criar descrição 
    ${RANDOM_PRODUCT_DESCRIPTION}      Generate Random String        length=5    chars=[NUMBERS]
    Set Test Variable        ${PRODUCT_DESCRICAO}       Descricaozinha-${RANDOM_PRODUCT_DESCRIPTION}  

Cadastrar produto
    [Arguments]        ${PRODUCT_NOME}    ${PRODUCT_DESCRICAO}     ${STATUS_CODE_EXPEC}
    ${BODY_PRODUCT}    Create Dictionary
    ...            nome=${PRODUCT_NOME}   
    ...            preco=2
    ...            descricao=${PRODUCT_DESCRICAO}   
    ...            quantidade=2

    Criar sessão na api autenticada
   
    ${RESPONSE}    POST On Session        
    ...            alias=etapavaIV_api_auth   
    ...            url=/produtos        
    ...            json=${BODY_PRODUCT}      
    ...            expected_status=${STATUS_CODE_EXPEC}

    Log    ${RESPONSE.json()}
    Set Test Variable     ${ID_PRODUCT}         ${RESPONSE.json()["_id"]}
    Set Test Variable     ${RESPONSE}       ${RESPONSE.json()}



Buscar produto cadastrado
    ${RESPONSE_SEARCH_PRODUCT}    GET On Session    alias=etapavaIV_api_auth    url=/produtos/${ID_PRODUCT}    expected_status=200
    Set Test Variable    ${RESPONSE_SEARCH_PRODUCT}    ${RESPONSE_SEARCH_PRODUCT.json()}

Validar o produto está cadastrado com sucesso
    Log     ${RESPONSE}
    Dictionary Should Contain Item    dictionary=${RESPONSE}    key=message    value=Cadastro realizado com sucesso
    Dictionary Should Contain Key        dictionary=${RESPONSE}    key=_id


Validar produto retornado
    Log    ${RESPONSE_SEARCH_PRODUCT}
    Dictionary Should Contain Item    dictionary=${RESPONSE_SEARCH_PRODUCT}       key=nome             value=${PRODUCT_NOME}
    Dictionary Should Contain Item    dictionary=${RESPONSE_SEARCH_PRODUCT}       key=descricao        value=${PRODUCT_DESCRICAO}
    Dictionary Should Contain Item    dictionary=${RESPONSE_SEARCH_PRODUCT}       key=_id              value=${ID_PRODUCT}  
    Dictionary Should Contain Item    dictionary=${RESPONSE_SEARCH_PRODUCT}       key=preco            value=${2}
    Dictionary Should Contain Item    dictionary=${RESPONSE_SEARCH_PRODUCT}       key=quantidade       value=${2}


#gk

e Cadastrar um produto
    Criar um novo produto
    Criar descrição
    Cadastrar produto   PRODUCT_NOME=${PRODUCT_NOME}    PRODUCT_DESCRICAO=${PRODUCT_DESCRICAO}  STATUS_CODE_EXPEC=201

e buscar pelo produto cadastrado
    Buscar produto cadastrado
    

Então o produto retornado deve ser o mesmo produto cadastrado   
    Validar produto retornado

Então o produto deve ser cadastrado com sucesso
    Validar o produto está cadastrado com sucesso