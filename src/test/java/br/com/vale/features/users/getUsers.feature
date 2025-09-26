@users @regression
Feature: Listar usuarios cadastrados

  Background:
    * def header = read('classpath:br/com/vale/support/config/headers.yaml')

  @list_users
  Scenario Outline: Lista de usuarios

    * def resp = read('classpath:br/com/vale/features/users/data/response/' + env + '/sucess.json')

    Given url url
    And  path '/usuarios',
    When method Get
    Then status <status_code>
    And match response == resp
    * print response

    Examples:
      |status_code |
      |       200  |