require 'httparty'
require 'nokogiri'
require 'json'

include HTTParty


url = "http://localhost:3000/tasks"
auth = {:username => "nmena.garzon@gmail.com", :password => "xxx"}
# auth = Base64.strict_encode64("nmena.garzon@gmail.com:xxx")

result = HTTParty.get(url,
  :headers => { 'Content-Type' => 'application/json' },
  :basic_auth => auth
)

# result = HTTParty.get(url,
#   :headers => { "Authorization" => "Basic #{auth}" },
# )


print JSON.parse(result.body)
