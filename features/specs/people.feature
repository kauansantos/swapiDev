#language: pt
#utf-8

Funcionalidade: Fluxo completo de validação de Pessoas
  Eu como uma aplicação de validação
  Quero receber informações sobre os atributos de Pessoas
  Para que o meu conhecimento sobre os personagens de Star Wars aumente cada vez mais

  Critérios de aceitação:
  Todos os dados inputados devem ser válidos
  Cada execução deverá retornar com código de retorno compatível com o especificado massa de testes
  Os contratos dos endpoints devem ser consistidos
  Gerar log das execuções para análise

  ##################################################################################################
  #   testes de Jornada GET Pessoas                                                                #
  ##################################################################################################

  @teste_get_pessoas
  Esquema do Cenário: Realizando consulta de dados de Pessoas
    Dado que eu acesse a aplicação swapi dev
    Quando realizar a consulta GET para trazer os dados de "<Pessoa>"
    Então deverá retonar os dados solicitados para a pessoa "<Pessoa>"
    E deverá retonar o código <statusCode>
    E realizar a validação do schema de resposta "<statusCode>"

    Exemplos:
      | Pessoa         | statusCode |
      | C-3PO          | 200        |
      | R2-D2          | 200        |
      | desconhecido   | 404        |
