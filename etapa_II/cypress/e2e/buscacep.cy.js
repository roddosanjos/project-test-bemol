
//Por ser um caso de teste simples, foi aplicado apenas uma organização por função dentro de um único arquivo.
//não sendo necessária a utilização de page objects

//Agrupamento único para os testes de busca
describe('Searchs', () => {
  //hook para iniciar a cada teste
  beforeEach(() => {
    cy.visit("http://www.buscacep.correios.com.br")   
  });
  
  it('Search by cep', () => {                                                 //cenário 1 - busca por cep - válido
    insert_value_search("69005-040")                                         //chama função passando o valor a ser pesquisado
    cy.get('tbody > tr > [data-th="CEP"]').should("have.text", "69005-040")  // assert no campo de cep
  });
  it('search by name', () => {                                               //cenário 2 - busca por nome - válido
    insert_value_search("Lojas Bemol")                                       //chama função passando o valor a ser pesquisado
    cy.get('tbody > tr > [data-th="CEP"]').should("have.text", "69005-901")  // assert no campo de cep
  });
  it('search by name - invalid', () => {                                                //cenário 3 - busca por valor inválido
    insert_value_search("69005-041")                                                    //chama função passando o valor a ser pesquisado
    cy.get('#mensagem-resultado').should("have.text", "Não há dados a serem exibidos")  // assert na respota de valor inválido
  });  
});


function insert_value_search(value){
  cy.get('#endereco').type(value)     //selecionar o campo e inserir o valor do cep   
  cy.get('#btn_pesquisar').click()          //clicar no botão de pesquisar 
}
