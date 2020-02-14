
# Classe de interface com a API
class RequisicaoAPI
  include HTTParty
  base_uri API_URI
  headers API_HEADERS
  default_timeout 120

  def initialize() end

  def find_specific(cep)
    self.class.get("/ws/#{cep}/json",
                   headers: API_HEADERS,
                   query: cep)
  end
end
