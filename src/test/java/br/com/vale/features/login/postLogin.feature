@login
Feature: Autentique o seu usuário para montar um carrinho e, se for administrador, gerenciar os produtos

  Background:
    * def header = read('classpath:br/com/vale/support/config/headers.yaml')
    * def getUserBody = call read("classpath:br/com/vale/features/users/getUsersId.feature@list_users_id")
    * def email = getUserBody.response.email
    * def password = getUserBody.response.password

  @Create_login
  Scenario Outline: Realizar login

    * def body = read('classpath:br/com/vale/features/login/data/payload/' + env + '/user.json')
    * def resp = read('classpath:br/com/vale/features/login/data/response/' + env + '/loginSucess.json')

    Given url url
    And  path '/login'
    And request body
    When method Post
    Then status <status_code>
    And match response == resp
    * print response

    Examples:
      |status_code |
      |       200  |