class PeopleClient

  include HTTParty
  include RSpec

  def get_people(pessoa)

    if pessoa == "C-3PO"
      pessoa_url = "2"
      end
    if pessoa == "R2-D2"
      pessoa_url = "3"
      end
    if pessoa == "desconhecido"
      pessoa_url = "1000"
    end

    @response = HTTParty.get("https://swapi.dev/api/people/#{pessoa_url}")
    log_util("Resposta GET People: #{@response.body}, code: #{@response.code}")
    @response
  end

  def verify_data_response(pessoa)
    if @response.code == 200
      expect(@response["name"]).to eql(pessoa)
      log_util("Pessoa verificada corretamente")
    else
    log_util("Pessoa desconhecida")
    end
  end

  def verify_status_code_response(statusCode)
    expect(@response.code).to eql(statusCode)
    log_util("statusCode verificado corretamente")
  end

  def validate_schema_response(statusCode)
    expect(@response).to match_json_schema("people_schema_#{statusCode}")
    log_util("Realizado verificação de contrato, o contrato esperado era o people_schema_#{statusCode}")
  end

end