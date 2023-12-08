*** Settings ***
Documentation    arquivo que contém todas as keywords relacionadas  a página search
...              as keywords estão organizadas por ordem de execução
Library        Browser

*** Variables ***
${SELECTOR_TILTE_SEARCH}             //div[@class='flex content-center text-s text-grey-700'][contains(.,'Como o pagamento afeta a classificação')] 
${SELECTOR_NAME_LIST_SEARCH}                (//span[contains(@itemprop,'name')])[1]
${SELECTOR_SCORE_LIST_SEARCH}               (//span[@itemprop='ratingValue'])[1]
${SELECTOR_VALUE_LIST_SEARCH}               (//p[@itemprop='price'])[1] 

*** Keywords ***
Selecionar a opção Ordenar por “${STRING_ORDER}"
    sleep  20
    Select Options By    select[id='sorting-selector']   label      ${STRING_ORDER}
    Log  ${STRING_ORDER}        
    sleep  20
    Wait For Elements State    selector=${SELECTOR_TILTE_SEARCH}     state=visible      
    Take Screenshot             

Verifique o nome do primeiro da lista
    ${RESULT_NAME} =  Browser.Get Text        ${SELECTOR_NAME_LIST_SEARCH} 
    Log    ${RESULT_NAME}
    Log To Console        ${RESULT_NAME}

Verifique a avaliação do primeiro da lista
    ${RESULT_NAME} =  Browser.Get Text        ${SELECTOR_SCORE_LIST_SEARCH}
    Log    ${RESULT_NAME}
    Log To Console        ${RESULT_NAME}

Verifique o valor do primeiro da lista       
    ${RESULT_NAME} =  Browser.Get Text        ${SELECTOR_VALUE_LIST_SEARCH} 
    Log    ${RESULT_NAME}   
    Log To Console        ${RESULT_NAME} 

 #Gherkin
e Selecionar a opção Ordenar por “Avaliação e sugestões"
    Selecionar a opção Ordenar por “Avaliação e sugestões"
     
Então o primeiro item da lista deve retornar um nome
    Verifique o nome do primeiro da lista

Então o primeiro item da lista deve retornar uma avaliação
    Verifique a avaliação do primeiro da lista

Então o primeiro item da lista deve retornar um valor 
    Verifique o valor do primeiro da lista  