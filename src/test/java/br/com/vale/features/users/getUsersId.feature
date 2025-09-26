@users @regression
Feature: Listar usuarios cadastrados por ID

  Background:
    * def header = read('classpath:br/com/vale/support/config/headers.yaml')

  @list_users_id
  Scenario Outline: Lista de usuarios por ID

    * def userId = call read("classpath:br/com/vale/features/users/postUsers.feature@create_users")
    * def resp = read('classpath:br/com/vale/features/users/data/response/' + env + '/getUserIdSucess.json')

    Given url url
    And  path 'usuarios/'+userId.response._id
    When method Get
    Then status <status_code>
    And match response == resp
    * print response

    Examples:
      |status_code |
      |       200  |