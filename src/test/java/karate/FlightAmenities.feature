Feature: by location

  Background: 
    * def responseToken = read('responseToken.json')

  Scenario Outline: Prueba OK
    Given url baseUrl
    Given path 'api/v2/airportsweather/getAirportsByLocation'
    * header Authorization = 'Bearer <grantAccess>'
    * configure headers = {pos:'web',client:'ecommerce',flow:'booking', x-clientkey: 'xqsTmYLzEdigE2A5c1Rz0EkGAuZ5USlb'}
    When method GET
    And print response
    Then status 200

    Examples: 
      | responseToken |
