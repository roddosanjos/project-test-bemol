*** Settings ***
Documentation    arquivo que contém todas as keywords relacionadas  a página home
...              as keywords estão organizadas por ordem de execução
Library        Browser

*** Variables ***
${URL_HOME}                            http://www.trivago.com.br
${SELECTOR_INPUT_HOME}                 //input[contains(@autocapitalize,'off')]
${SELECTOR_FILTER_HOME}                //strong[@class='mb-1 pl-3 truncate block text-left'][contains(.,'Filtros')]  


*** Keywords ***
Acessar o site "${URL_HOME}"
    New Page       ${URL_HOME} 
    Wait For Elements State         selector=${SELECTOR_INPUT_HOME}    state=visible

Digitar o valor “${STRING_SEARCH}” no campo de busca                    
  
    Fill Text       selector=${SELECTOR_INPUT_HOME}    txt=${STRING_SEARCH}
    Sleep    2                                                                             
    Browser.Get Text        ${SELECTOR_INPUT_HOME}     ==   ${STRING_SEARCH}              

Clicar no botão "${BUTTON_NAME}"
     Click    selector=//button[@type='button'][contains(.,'${BUTTON_NAME}')] 
     Click    selector=//button[@type='button'][contains(.,'${BUTTON_NAME}')] 
     Wait For Elements State         selector=${SELECTOR_FILTER_HOME}     state=visible     timeout=10
    

Verifique a mudança de página 
    Get Title    equal    Hotéis em Manaus | Pesquise e compare ótimas ofertas no trivago               


#Gherkin

Dado que estou na home "http://www.trivago.com.br"
    Acessar o site "http://www.trivago.com.br"

Quando inserir o valor “Manaus” no campo de busca
    Digitar o valor “Manaus” no campo de busca

e Clicar no botão "Pesquisar"
    Clicar no botão "Pesquisar"

Entao a página deve exibir os resultados da busca    
    Verifique a mudança de página 
