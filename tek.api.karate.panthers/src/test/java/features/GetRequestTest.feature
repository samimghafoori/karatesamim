Feature: Get Request API Test
@Token
Scenario: Get Account Test
 * url "https://tek-insurance-api.azurewebsites.net"
 * def token = call read("GenerateToken.feature")
 * def tokenValue = token.response.token
 * header Authorization = "Bearer " + tokenValue
 * path "/api/accounts/get-primary-account"
 * param primaryPersonId = 2521
 * method get
 * print response