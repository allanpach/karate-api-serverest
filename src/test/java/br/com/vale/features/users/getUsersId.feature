@users @regression
Feature: Listar usuarios cadastrados por ID

  Background:
    * def header = read('classpath:br/com/vale/support/config/headers.yaml')

  @list_users_id
  Scenario Outline: Lista de usuarios por ID: <test_case>

    * def userId = call read("classpath:br/com/vale/features/users/postUsers.feature@positive")
    * def resp = read('classpath:br/com/vale/features/users/data/response/' + env + '/<response_body>.json')

    Given url url
    And  path 'usuarios/<path>
    When method Get
    Then status <status_code>
    And match response == resp
    * print response

    @positive
    Examples:
      |test_case  |status_code |response_body  |path                 |
      |Sucesso    |       200  |getUserIdSucess|'+userId.response._id|

    @negative
    Examples:
      | test_case       |status_code |response_body       |path             |
      |ID sem cadastro  |       400  |getUserIdNotFounf   |1aAAaa1AaAAaaAAa'|