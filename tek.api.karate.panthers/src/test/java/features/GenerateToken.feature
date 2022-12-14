Feature: Generate Token For API
 @Test
  Scenario: Generate token For CSR Protal
    * url "https://tek-insurance-api.azurewebsites.net"
    * path "/api/token"
    * request {"username":"supervisor","password":"tek_supervisor"}
    * method post
    * print response.token
    * print response.fullName
    * print response
    * status 200
