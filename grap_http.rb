require 'httparty'
require 'nokogiri'
require 'json'

include HTTParty

url = "http://localhost:3000/tasks"

result = HTTParty.get(url,
  :headers => { "Authorization": 'Token token="957299b7b21a4681b49b34f1f6d968e3"' },
)


print JSON.parse(result.body)
