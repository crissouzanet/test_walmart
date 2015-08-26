Feature: Busca
  In order Buscar pelo termo 'tv',
  As an Usuário
  I want selecionar um resultado validando se o mesmo está correto e adicionar ao carrinho

  Scenario: Fazer uma busca por TV
    Given Eu estou na pagina do "http://www.walmart.com.br/"
    And Eu preencho "suggestion-search" com "tv"
    When Eu clico "Procurar"
    Then Eu devo visualizar a lista de produtos
    Given Eu estou na pagina do resultado da busca e devo visualizar a lista de produtos
    When Eu clico no primeiro item da lista
    Then Eu devo visualizar a página do produto com o botão "Adicionar ao carrinho" e clicar em "Continuar" quando visualizar o lightbox
    When Eu clico no carrinho
    Then Eu visualizo a lista de itens
