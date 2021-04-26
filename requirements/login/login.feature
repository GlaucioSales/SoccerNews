Feature: Login
  como um cliente
  Quero poder acessar minha conta e me manter logado
  Para que que eu possa ver as noticias do meu time do coração

  Scenario:
    Given que o cliente informou as credenciais válidas,
    When solicitar para fazer o login
    Then o sistema deve enviar o usuario para a tela de noticias
    And Manter o usuário logado

  Scenario:
    Given que o cliente informou as credenciais invalidas
    When solicitou para fazer o login
    Then o Sistema deve retornar uma mensagem de erro