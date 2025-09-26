@users @regression
Feature: Criar os usuarios

  Background:
    * def header = read('classpath:br/com/vale/support/config/headers.yaml')
    * def email = Java.type('br.com.vale.support.utils.Utils').generateEmail()
    * def password = Java.type('br.com.vale.support.utils.Utils').password()
    * def name = Java.type('br.com.vale.support.utils.Utils').generateNewName()

  @create_users
  Scenario Outline: Cadastrar usuario: <test_case>

    * def body = read('classpath:br/com/vale/features/users/data/payload/' + env + '/<request_boby>.json')
    * def resp = read('classpath:br/com/vale/features/users/data/response/' + env + '/<response_body>.json')

    Given url url
    And  path 'usuarios'
    And request body
    When method Post
    Then status <status_code>
    And match response == resp
    * print response

    @positive
    Examples:
      |test_case  |status_code |request_boby  |response_body    |
      |Sucesso    |       201  |postUserId    |postUserSucess   |

    @negative
    Examples:
      | test_case |status_code |request_boby |response_body|
      |Erro       |       400  |postUserError|postUserError  |