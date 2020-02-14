require "cucumber"
require "httparty"
require "httparty/request"
require "httparty/response/headers"
require "rspec"

API_HEADERS = { "Content-Type" => "application/json" }
API_URI = "https://viacep.com.br/"
