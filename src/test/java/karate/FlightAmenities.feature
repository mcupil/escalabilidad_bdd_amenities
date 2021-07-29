Feature: by location

  Background: 
    * def responseToken = read('responseToken.json')

  Scenario Outline: Prueba OK
    Given url baseUrl
    Given path ''
    * header Authorization = 'Bearer <grantAccess>'
    * configure headers = {pos:'web',client:'ecommerce',flow:'booking', x-clientkey: 'xqsTmYLzEdigE2A5c1Rz0EkGAuZ5USlb'}
    When method GET
    And print response
    Then status 200

    Examples: 
      | responseToken |
      
 Scenario Outline: Path no encontrado
    Given url baseUrl
    Given path ''
    * header Authorization = 'Bearer <grantAccess>'
    * configure headers = {pos:'web',client:'ecommerce',flow:'booking', x-clientkey: 'xqsTmYLzEdigE2A5c1Rz0EkGAuZ5USlb'}
    When method GET
    And print response
    Then status 404

    Examples: 
      | responseToken |
      
 Scenario Outline: Path no encontrado- caracteres especiales
    Given url baseUrl
    Given path 'URL+|)(/&%$#$%&/'
    * header Authorization = 'Bearer <grantAccess>'
    * configure headers = {pos:'web',client:'ecommerce',flow:'booking', x-clientkey: 'xqsTmYLzEdigE2A5c1Rz0EkGAuZ5USlb'}
    When method GET
    And print response
    Then status 404

    Examples: 
      | responseToken |  
      
 Scenario Outline: Pos solo minusculas 
    Given url baseUrl
    Given path 'URL'
    * header Authorization = 'Bearer <grantAccess>'
    * configure headers = {pos:'web',client:'ecommerce',flow:'booking', x-clientkey: 'xqsTmYLzEdigE2A5c1Rz0EkGAuZ5USlb'}
    When method GET
    And print response
    Then status 200

    Examples: 
      | responseToken |  
      
 Scenario Outline: Pos solo letras mayusculas  
    Given url baseUrl
    Given path 'URL'
    * header Authorization = 'Bearer <grantAccess>'
    * configure headers = {pos:'WEB',client:'ecommerce',flow:'booking', x-clientkey: 'xqsTmYLzEdigE2A5c1Rz0EkGAuZ5USlb'}
    When method GET
    And print response
    Then status 200

    Examples: 
      | responseToken | 
      
 Scenario Outline: Pos solo numeros 
    Given url baseUrl
    Given path 'URL'
    * header Authorization = 'Bearer <grantAccess>'
    * configure headers = {pos:'123456',client:'ecommerce',flow:'booking', x-clientkey: 'xqsTmYLzEdigE2A5c1Rz0EkGAuZ5USlb'}
    When method GET
    And print response
    Then status 400

    Examples: 
      | responseToken | 
      
 Scenario Outline: Pos validacion de caracteres especiales 
    Given url baseUrl
    Given path 'URL'
    * header Authorization = 'Bearer <grantAccess>'
    * configure headers = {pos:',.-{}+',client:'ecommerce',flow:'booking', x-clientkey: 'xqsTmYLzEdigE2A5c1Rz0EkGAuZ5USlb'}
    When method GET
    And print response
    Then status 400

    Examples: 
      | responseToken | 
      
      
Scenario Outline: Pos validacion no acepte campos vacios
    Given url baseUrl
    Given path 'URL'
    * header Authorization = 'Bearer <grantAccess>'
    * configure headers = {pos:' ',client:'ecommerce',flow:'booking', x-clientkey: 'xqsTmYLzEdigE2A5c1Rz0EkGAuZ5USlb'}
    When method GET
    And print response
    Then status 400

    Examples: 
      | responseToken | 
      
      
Scenario Outline: Pos validacion parametro no ingresado
    Given url baseUrl
    Given path 'URL'
    * header Authorization = 'Bearer <grantAccess>'
    * configure headers = {client:'ecommerce',flow:'booking', x-clientkey: 'xqsTmYLzEdigE2A5c1Rz0EkGAuZ5USlb'}
    When method GET
    And print response
    Then status 400

    Examples: 
      | responseToken | 
      
      
Scenario Outline: Pos validacion no acepte campos vacios
    Given url baseUrl
    Given path 'URL'
    * header Authorization = 'Bearer <grantAccess>'
    * configure headers = {pos:' ',client:'ecommerce',flow:'booking', x-clientkey: 'xqsTmYLzEdigE2A5c1Rz0EkGAuZ5USlb'}
    When method GET
    And print response
    Then status 400

    Examples: 
      | responseToken |                   
      
      
Scenario Outline: client solo letras minusculas
    Given url baseUrl
    Given path 'URL'
    * header Authorization = 'Bearer <grantAccess>'
    * configure headers = {pos:'web',client:'ecommerce',flow:'booking', x-clientkey: 'xqsTmYLzEdigE2A5c1Rz0EkGAuZ5USlb'}
    When method GET
    And print response
    Then status 200

    Examples: 
      | responseToken |                           
      
Scenario Outline: client solo letras MAYUSCULAS
    Given url baseUrl
    Given path 'URL'
    * header Authorization = 'Bearer <grantAccess>'
    * configure headers = {pos:'web',client:'ECOMMERCE',flow:'booking', x-clientkey: 'xqsTmYLzEdigE2A5c1Rz0EkGAuZ5USlb'}
    When method GET
    And print response
    Then status 200

    Examples: 
      | responseToken | 
      
Scenario Outline: client solo numeros
    Given url baseUrl
    Given path 'URL'
    * header Authorization = 'Bearer <grantAccess>'
    * configure headers = {pos:'web',client:'012588543546546546546546546456465465465',flow:'booking', x-clientkey: 'xqsTmYLzEdigE2A5c1Rz0EkGAuZ5USlb'}
    When method GET
    And print response
    Then status 400

    Examples: 
      | responseToken |  
      
Scenario Outline: client caracteres especiales 
    Given url baseUrl
    Given path 'URL'
    * header Authorization = 'Bearer <grantAccess>'
    * configure headers = {pos:'web',client:'#|(&/%$#$#%&/(&%%$$%&/&&',flow:'booking', x-clientkey: 'xqsTmYLzEdigE2A5c1Rz0EkGAuZ5USlb'}
    When method GET
    And print response
    Then status 400

    Examples: 
      | responseToken |
      
Scenario Outline: client validacion de campos vacios
    Given url baseUrl
    Given path 'URL'
    * header Authorization = 'Bearer <grantAccess>'
    * configure headers = {pos:'web',client:' ',flow:'booking', x-clientkey: 'xqsTmYLzEdigE2A5c1Rz0EkGAuZ5USlb'}
    When method GET
    And print response
    Then status 400

    Examples: 
      | responseToken |   
      
Scenario Outline: validar no se ingrese parametro client
    Given url baseUrl
    Given path 'URL'
    * header Authorization = 'Bearer <grantAccess>'
    * configure headers = {pos:'web',flow:'booking', x-clientkey: 'xqsTmYLzEdigE2A5c1Rz0EkGAuZ5USlb'}
    When method GET
    And print response
    Then status 400

    Examples: 
      | responseToken | 
      
Scenario Outline: Flow solo letras minusculas 
    Given url baseUrl
    Given path 'URL'
    * header Authorization = 'Bearer <grantAccess>'
    * configure headers = {pos:'web',client:'ecommerce',flow:'booking', x-clientkey: 'xqsTmYLzEdigE2A5c1Rz0EkGAuZ5USlb'}
    When method GET
    And print response
    Then status 200

    Examples: 
      | responseToken |  
      
Scenario Outline: Flow solo letras MAYUSCULAS 
    Given url baseUrl
    Given path 'URL'
    * header Authorization = 'Bearer <grantAccess>'
    * configure headers = {pos:'web',client:'ecommerce',flow:'BOOKING', x-clientkey: 'xqsTmYLzEdigE2A5c1Rz0EkGAuZ5USlb'}
    When method GET
    And print response
    Then status 200

    Examples: 
      | responseToken | 
      
Scenario Outline: Flow solo numeros  
    Given url baseUrl
    Given path 'URL'
    * header Authorization = 'Bearer <grantAccess>'
    * configure headers = {pos:'web',client:'ecommerce',flow:'9879846132351656465465454654', x-clientkey: 'xqsTmYLzEdigE2A5c1Rz0EkGAuZ5USlb'}
    When method GET
    And print response
    Then status 400

    Examples: 
      | responseToken |                          
                      
Scenario Outline: Flow solo caracteres especiales  
    Given url baseUrl
    Given path 'URL'
    * header Authorization = 'Bearer <grantAccess>'
    * configure headers = {pos:'web',client:'ecommerce',flow:'|)(/&%$%&/(/&%$#"""#', x-clientkey: 'xqsTmYLzEdigE2A5c1Rz0EkGAuZ5USlb'}
    When method GET
    And print response
    Then status 400

    Examples: 
      | responseToken |  
      
Scenario Outline: Flow campo vacio
    Given url baseUrl
    Given path 'URL'
    * header Authorization = 'Bearer <grantAccess>'
    * configure headers = {pos:'web',client:'ecommerce',flow:' ', x-clientkey: 'xqsTmYLzEdigE2A5c1Rz0EkGAuZ5USlb'}
    When method GET
    And print response
    Then status 400

    Examples: 
      | responseToken | 
      
Scenario Outline: parametro flow no se ingrese
    Given url baseUrl
    Given path 'URL'
    * header Authorization = 'Bearer <grantAccess>'
    * configure headers = {pos:'web',client:'ecommerce', x-clientkey: 'xqsTmYLzEdigE2A5c1Rz0EkGAuZ5USlb'}
    When method GET
    And print response
    Then status 400

    Examples: 
      | responseToken | 
      
Scenario Outline: x-clientkey validacion mayusculas minusculas OK 
    Given url baseUrl
    Given path 'URL'
    * header Authorization = 'Bearer <grantAccess>'
    * configure headers = {pos:'web',client:'ecommerce',flow:'booking', x-clientkey: 'xqsTmYLzEdigE2A5c1Rz0EkGAuZ5USlb'}
    When method GET
    And print response
    Then status 200

    Examples: 
      | responseToken |    
      
Scenario Outline: x-clientkey validacion solo numeros 
    Given url baseUrl
    Given path 'URL'
    * header Authorization = 'Bearer <grantAccess>'
    * configure headers = {pos:'web',client:'ecommerce',flow:'booking', x-clientkey: '526465465464654'}
    When method GET
    And print response
    Then status 401

    Examples: 
      | responseToken |
                                                     
Scenario Outline: x-clientkey validacion no acepte caracteres especiales 
    Given url baseUrl
    Given path 'URL'
    * header Authorization = 'Bearer <grantAccess>'
    * configure headers = {pos:'web',client:'ecommerce',flow:'booking', x-clientkey: '|#(/&%$#$%&/'}
    When method GET
    And print response
    Then status 401

    Examples: 
      | responseToken |
      
Scenario Outline: x-clientkey validacionno no acepte campos vacios  
    Given url baseUrl
    Given path 'URL'
    * header Authorization = 'Bearer <grantAccess>'
    * configure headers = {pos:'web',client:'ecommerce',flow:'booking', x-clientkey: ' '}
    When method GET
    And print response
    Then status 401

    Examples: 
      | responseToken | 
      
Scenario Outline: x-clientkey parametro no se ingrese 
    Given url baseUrl
    Given path 'URL'
    * header Authorization = 'Bearer <grantAccess>'
    * configure headers = {pos:'web',client:'ecommerce',flow:'booking'}
    When method GET
    And print response
    Then status 401

    Examples: 
      | responseToken | 
      
Scenario Outline: x-clientkey validacion letras minusculas que sea invalido el dato
    Given url baseUrl
    Given path 'URL'
    * header Authorization = 'Bearer <grantAccess>'
    * configure headers = {pos:'web',client:'ecommerce',flow:'booking', x-clientkey: 'jnzbhhdbhjsbrf'}
    When method GET
    And print response
    Then status 401

    Examples: 
      | responseToken |  
      
Scenario Outline: x-clientkey validacion solo letras mayusculas con dato invalido 
    Given url baseUrl
    Given path 'URL'
    * header Authorization = 'Bearer <grantAccess>'
    * configure headers = {pos:'web',client:'ecommerce',flow:'booking', x-clientkey: 'UIEYRUHKJSDFBSDKFBSDHFBSDJDHFBSDJHFBSDFDFSF'}
    When method GET
    And print response
    Then status 401

    Examples: 
      | responseToken |         
      
                                       
