*** Settings ***
Documentation          foi utilizado o padrão de Page Objects organização dos testes
...                    Também foi utilzida o padrão gherkin para descrição dos testes 
Resource               trivago_resources_commom.robot
Resource               trivago_resource_home.robot
Resource               trivago_resource_search.robot
Suite Setup            Abrir o navegador
Suite Teardown         Fechar o navegador

***test cases***
 Caso 1 - buscar na trivago
     [Documentation]     Esse teste veirica o funcionamento da busca do site trivago.com com a fixa string de busca "manaus"
     [Tags]              Busca_por_cidade
      Dado que estou na home "http://www.trivago.com.br"
      Quando inserir o valor “Manaus” no campo de busca
      e Clicar no botão "Pesquisar"
      Entao a página deve exibir os resultados da busca 


Caso 2 - ordenar pequisa
     [Documentation]    Esse teste verifica a ordenação de por "Avaliação e Sugestões" no site da trivago.com
     [Tags]             busca_ordenacao
     Dado que estou na home "http://www.trivago.com.br"
     Quando inserir o valor “Manaus” no campo de busca
     e Clicar no botão "Pesquisar"
     e Selecionar a opção Ordenar por “Avaliação e sugestões"
     Então o primeiro item da lista deve retornar um nome
     Então o primeiro item da lista deve retornar uma avaliação
     Então o primeiro item da lista deve retornar um valor