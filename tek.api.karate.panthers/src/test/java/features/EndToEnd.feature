Feature: End to End Testing of API

  @e2e
  Scenario: end to end
    Given url "https://tek-insurance-api.azurewebsites.net"
    * def token = call read("GenerateToken.feature")
    * def tokenValue = token.response.token
    * header Authorization = "Bearer " + tokenValue
    * path "api/accounts/add-primary-account"
    * def generator = Java.type("api.test.DataGenerator")
    * def email = generator.getEmail()
    * def firstName = generator.getFirstName()
    * def lastName = generator.getLastName()
    * def dateOfBirth = generator.getDob()
    * def title = generator.getTitle()
    * def gender = generator.getGender()
    * def job = generator.getJob()
    * def maritalStatus = generator.getMaritalstatus()
    * request
      """
      {
      "email":"#(email)",
      "firstName":"#(firstName)",
      "lastName":"#(lastName)",
      "title":"#(title)",
      "gender":"#(gender)",
      "maritalStatus":"#(single)",
      "employmentStatus":"#(job)",
      "dateOfBirth": "#(dateOfBirth)"
      }
      """
    * method post
    * status 201
    * print response.id
    * def dbresult = Java.type("api.test.DatabaseConnectionUtility")
    * def dbemail = dbresult.result("select * from primary_person where id = '" + response.id +"'", "email" )
    * def dbFirstname = dbresult.result("select * from primary_person where id = '" + response.id +"'", "first_name" )
    * def dbLastName = dbresult.result("select * from primary_person where id = '" + response.id +"'", "last_name" )
    * def dbTitle = dbresult.result("select * from primary_person where id = '" + response.id +"'", "title" )
    * def dbGender = dbresult.result("select * from primary_person where id = '" + response.id +"'", "gender" )
    * def dbMaritalStatus = dbresult.result("select * from primary_person where id = '" + response.id +"'", "single" )
    * def dbEmpStatus = dbresult.result("select * from primary_person where id = '" + response.id +"'", "employment_status" )
    * def dbdateOfBirth = dbresult.result("select * from primary_person where id = '" + response.id +"'", "date_of_birth" )
    * match dbemail == email
    * match dbFirstname == firstName
    * match dbLastName == lastName
    * match dbTitle == title
    * match dbGender == gender
    * match dbMaritalStatus == single
    * match dbEmpStatus == job
    * match dbdateOfBirth contains dateOfBirth
