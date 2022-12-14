Feature: Put Request Test

  @UpdateTheCar
  Scenario: Update the car
    * url "https://tek-insurance-api.azurewebsites.net"
    * def token = call read("GenerateToken.feature")
    * def tokenValue = token.response.token
    * header Authorization = "Bearer " + tokenValue
    * def postRequest = callonce read("EndToEnd.feature")
    * def idValue = postRequest.response.id
    * param primaryPersonId = idValue
    * path "api/accounts/add-account-car"
    * request
      """
      {
      "id": 0,
      "make": "Toyota",
      "model": "corrolla",
      "year": "1997",
      "licensePlate": "TEK1122"
      }
      """
    * method post
    * status 201
    * print response
    * url "https://tek-insurance-api.azurewebsites.net"
    * def token = call read("GenerateToken.feature")
    * def tokenValue = token.response.token
    * header Authorization = "Bearer " + tokenValue
    * def carid = response.id
    * param primaryPersonId = idValue
    * path "/api/accounts/update-account-car"
    * request
      """
      {
      "id": "#(carid)",
      "make": "Acura",
      "model": "QX70",
      "year": "2023",
      "licensePlate": "SDET001"
      }
      """
    * method put
    * status 200
    * print response
   
      
      
