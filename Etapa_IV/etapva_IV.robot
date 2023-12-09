*** Settings ***
Documentation           Cenários de teste
Resource        usuario.resource
Resource        produto.resource
Resource        commom.resource

*** Test Cases ***

Cadastrar um usuário na api com retorno 200
    Dado que foi criado um novo usuario
    Quando cadastrar o usuário na api
    Então esse usuário deve ser cadastrado com sucesso 
    
Buscar usuário criado
    Dado que foi criado um novo usuario
    Quando cadastrar o usuário na api
    e Pesquisar pelo usuário cadastrado
    Entao o usuário pesquisado deve ser o mesmo cadastrado   

Cadastrar um produto na api com retorno 200
    Dado que foi criado um novo usuario
    Quando cadastrar o usuário na api
    e Pesquisar pelo usuário cadastrado
    e Autenticar esse usuario
    e Cadastrar um produto
    Então o produto deve ser cadastrado com sucesso
   
Buscar produto criado
    Dado que foi criado um novo usuario
    Quando cadastrar o usuário na api
    e Pesquisar pelo usuário cadastrado
    e Autenticar esse usuario
    e Cadastrar um produto
    e buscar pelo produto cadastrado
    Então o produto retornado deve ser o mesmo produto cadastrado
