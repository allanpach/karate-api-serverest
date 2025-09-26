@login @regression
Feature: Autentique o seu usuário para montar um carrinho e, se for administrador, gerenciar os produtos

  Background:
    * def header = read('classpath:br/com/vale/support/config/headers.yaml')
    * def getUserBody = call read("classpath:br/com/vale/features/users/getUsersId.feature@positive")
    * def email = getUserBody.response.email
    * def password = getUserBody.response.password

  @Create_login
  Scenario Outline: Realizar login: <test_case>

    * def body = read('classpath:br/com/vale/features/login/data/payload/' + env + '/<request_boby>.json')
    * def resp = read('classpath:br/com/vale/features/login/data/response/' + env + '/<response_body>.json')

    Given url url
    And  path '/login'
    And request body
    When method Post
    Then status <status_code>
    And match response == resp
    * print response

    @positive
    Examples:
      |test_case  |status_code |request_boby|response_body |
      |Sucesso    |       200  |user        |loginSucess   |

    @negative
    Examples:
      | test_case       |status_code |request_boby    |response_body|
      |E-mail invalido  |       400  |userInvalidEmail|emailError   |

    @negative
    Examples:
      |test_case     |status_code |request_boby       |response_body|
      |Senha invalida|       401  |userInvalidPassword|loginError   |