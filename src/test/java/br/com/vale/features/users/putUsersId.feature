@users @regression
Feature: Editar usuario

  Background:
    * def header = read('classpath:br/com/vale/support/config/headers.yaml')
    * def email = Java.type('br.com.vale.support.utils.Utils').generateEmail()
    * def password = Java.type('br.com.vale.support.utils.Utils').password()
    * def name = Java.type('br.com.vale.support.utils.Utils').generateNewName()

  @edit_users
  Scenario Outline: Editar usuario por ID: <test_case>
    * def userId = call read("classpath:br/com/vale/features/users/postUsers.feature@positive")
    * def body = read('classpath:br/com/vale/features/users/data/payload/' + env + '/<request_body>.json')
    * def resp = read('classpath:br/com/vale/features/users/data/response/' + env + '/<response_body>.json')

    Given url url
    And  path 'usuarios/<path>
    And request body
    When method Put
    Then status <status_code>
    And match response == resp
    * print response

    @positive
    Examples:
      |test_case  |status_code |request_body|response_body  |path                 |
      |Sucesso    |200         |putUserId   |putUserIdSucess|'+userId.response._id|

    @negative
    Examples:
      |test_case          |status_code |request_body  |response_body |path            |
      |E-mail com cadastro|400         |putUserIdError|putUserIdError|0uxuPY0cbmQhpEz1'|