@users @regression
Feature: Editar usuario

  Background:
    * def header = read('classpath:br/com/vale/support/config/headers.yaml')
    * def email = Java.type('br.com.vale.support.utils.Utils').generateEmail()
    * def password = Java.type('br.com.vale.support.utils.Utils').password()
    * def name = Java.type('br.com.vale.support.utils.Utils').generateNewName()

  @edit_users
  Scenario Outline: Editar usuario por ID
    * def userId = call read("classpath:br/com/vale/features/users/postUsers.feature@create_users")
    * def body = read('classpath:br/com/vale/features/users/data/payload/' + env + '/putUserId.json')
    * def resp = read('classpath:br/com/vale/features/users/data/response/' + env + '/putUserIdSucess.json')

    Given url url
    And  path 'usuarios/'+userId.response._id
    And request body
    When method Put
    Then status <status_code>
    And match response == resp
    * print response

    Examples:
      |status_code |
      |       200  |