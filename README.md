# project-test-bemol
Repositório criado para um teste de admissão 

Os cenários automatizados dos testes estão disponíveis em https://github.com/roddosanjos/project-test-bemol (público)
Para acessálos basta realizar um fork no projeto. 
Seguem as instruções para executar os cenários de cada etapa.

#Etapa II
Para executar os cenários da Etapa ii é necessário que a máquina esteja configurada com os seguintes programas
- Node.js   
    - https://nodejs.org/en/download
- Cypress  
    - npm init --yes (executar no repositorio)
    - npm install - D cypress (instalar)
    - npx cypress open (abrir o cypress)

- Após configuração basta executar o arquivo etapa_II/cypress/e2e/buscacep.cy.js
________________________________________________________________________________________________

Para executar os cenários das Etapa III e IV é necessário que a máquina esteja configurada com os seguintes programas

- Python
 - https://www.python.org/downloads/
- Robotframework
 - pip install robotframework 





 
#Etapa III
Configurações específicas para a etapa III
- Libraries 
 - pip install robotframework-browser
 - rfbrowser init

Para rodar os testes é necessário abrir o prompt de comando
- Estar dentro do repositório ' ~\etapa_III '
- executar a seguinte linha de comando  ' robot -d ./meusResultados .\trivago_tests.robot '
- os logs estarão na página /meusResultados após a excecução dos testes e podem ser aberto via navegador.



#Etapa IV
