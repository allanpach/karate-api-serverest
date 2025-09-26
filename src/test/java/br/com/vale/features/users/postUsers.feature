@users @regression
Feature: Criar os usuarios

  Background:
    * def header = read('classpath:br/com/vale/support/config/headers.yaml')
    * def email = Java.type('br.com.vale.support.utils.Utils').generateEmail()
    * def password = Java.type('br.com.vale.support.utils.Utils').password()
    * def name = Java.type('br.com.vale.support.utils.Utils').generateNewName()

  @create_users
  Scenario Outline: Cadastrar usuario

    * def body = read('classpath:br/com/vale/features/users/data/payload/' + env + '/postUserId.json')
    * def resp = read('classpath:br/com/vale/features/users/data/response/' + env + '/postUserSucess.json')

    Given url url
    And  path 'usuarios'
    And request body
    When method Post
    Then status <status_code>
    And match response == resp
    * print response

    Examples:
      |status_code |
      |       201  |