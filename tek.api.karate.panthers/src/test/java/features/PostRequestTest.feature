Feature: Post Request Tests

  Background: 
    Given url "https://tek-insurance-api.azurewebsites.net"
    * def token = call read("GenerateToken.feature")
    * def tokenValue = token.response.token
    * header Authorization = "Bearer " + tokenValue
    * path "/api/accounts/add-primary-account"

  Scenario: Verify post Request method
    * request
      """
      {
      "email":"karateCall675@tekschool.com",
      "firstName":"Panthers",
      "lastName":"TEK",
      "title":"MR",
      "gender":"MALE",
      "maritalStatus":"SINGLE",
      "employmentStatus":"Student",
      "dateOfBirth": "1990-01-20"
      }
      """
    * method post
    * status 201
    * print response

  @postCall
  Scenario: Post Request with faker data
    * def generator = Java.type("api.test.DataGenerator")
    * def email = generator.getEmail()
    * def firstName = generator.getfristName()
    * def lastName = generator.getlastName()
    * def title = generator.getTitle()
    * def dateOfBirth = generator.getDob()
    * request
      """
      {
       "email":"#(email)",
       "firstName":"#(firstName)",
       "lastName":"#(lastName)",
       "title":"#(title)",
       "gender":"MALE",
       "maritalStatus":"SINGLE",
       "employmentStatus":"Student",
       "dateOfBirth": "#(dateOfBirth)"
       }
      """
    * method post
    * status 201
    * print response
    * match email == response.email
    * match firstName == response.firstName
    * match lastName == response.lastName
    * print response
