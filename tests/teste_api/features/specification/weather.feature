#language: pt
# force_encoding("UTF-8")
# force_encoding(Encoding::UTF_8)

@weather
Funcionalidade: Consultar clima usando API Open Weather
   Como usuário
   Desejo fazer consulta variadas sobre o clima utilizando a API

  @cities_weather
  Esquema do Cenário: Consultar o clima de uma cidade 
    Dado que o usuário deseja consultar o clima de uma "<cidade>"
    Quando realizo a consulta
    Então recebo as condições do clima no momento na "<cidade>"

    Exemplos:
    |   cidade   |
    | Guarulhos  |
    | Ilhabela   |      
    | São Paulo  |

  @city_by_id_weather
  Esquema do Cenário: Consultar o clima de uma cidade por ID
    Dado que o usuário deseja consultar o clima de uma cidade com um <id>
    Quando realizo a consulta
    Então recebo as condições do clima pelo <id> na cidade

    Exemplos:
    |   id     | 
    | 3461786  |
    | 3461425  |
    | 3448439  |

  @city_by_coordinates
  Esquema do Cenário: Consultar o clima de uma cidade por coordenadas
    Dado que o usuário deseja consultar o clima de uma cidade com uma coordenada <lon> e <lat>
    Quando realizo a consulta
    Então recebo as condições do clima pelas <lon> e <lat> da cidade

    Exemplos:
    |  lon    |  lat   |
    | -46.53  | -23.46 |
    | -45.36  | -23.78 |
    | -46.64  | -23.55 |

  @nonexistent_city
  Cenário: Consultar o clima de uma cidade inexistente
    Dado que o usuário deseja consultar o clima de uma cidade que não existe
    Quando realizo a consulta
    Então recebo o status page '404'