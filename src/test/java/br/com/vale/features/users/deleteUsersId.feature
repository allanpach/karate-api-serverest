@users @regression
Feature: Excluir usuario

  Background:
    * def header = read('classpath:br/com/vale/support/config/headers.yaml')

  @test_application
  Scenario Outline: Excluir usuario por ID: <test_case>
    * def userId = call read("classpath:br/com/vale/features/users/postUsers.feature@positive")
    * def resp = read('classpath:br/com/vale/features/users/data/response/' + env + '/<response_body>.json')

    Given url url
    And  path 'usuarios/<path>
    When method Delete
    Then status <status_code>
    And match response == resp
    * print response

    @positive
    Examples:
      |test_case  |status_code |response_body     |path                 |
      |Sucesso    |       200  |deleteUserIdSucess|'+userId.response._id|

    @negative
    Examples:
      | test_case       |status_code |response_body       |path        |
      |ID sem cadastro  |       200  |deleteUserIdNotFound|3sa6mmaqwaCv'|