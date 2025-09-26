@users @regression
Feature: Excluir usuario

  Background:
    * def header = read('classpath:br/com/vale/support/config/headers.yaml')

  @test_application
  Scenario Outline: Excluir usuario por ID
    * def userId = call read("classpath:br/com/vale/features/users/postUsers.feature@create_users")
    * def resp = read('classpath:br/com/vale/features/users/data/response/' + env + '/deleteUserIdSucess.json')

    Given url url
    And  path 'usuarios/'+userId.response._id
    When method Delete
    Then status <status_code>
    And match response == resp
    * print response

    Examples:
      |status_code |
      |       200  |