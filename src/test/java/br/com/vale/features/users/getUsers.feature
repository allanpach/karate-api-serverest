@users @regression
Feature: Listar usuarios cadastrados

  Background:
    * def header = read('classpath:br/com/vale/support/config/headers.yaml')

  @list_users
  Scenario Outline: Lista de usuarios: <test_case>

    * def resp = read('classpath:br/com/vale/features/users/data/response/' + env + '/<response_body>.json')

    Given url url
    And  path '/<path>'
    When method Get
    Then status <status_code>
    And match response == resp
    * print response

    @positive
    Examples:
      |test_case  |status_code |response_body|path    |
      |Sucesso    |       200  |sucess       |usuarios|

    @negative
    Examples:
      | test_case       |status_code |response_body|path |
      |ID sem cadastro  |       405  |pathInvalid  |users|