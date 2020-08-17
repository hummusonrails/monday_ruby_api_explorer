require 'json'
require 'net/http'
require 'dotenv'
Dotenv.load

class Monday::HttpRequest
  def request(query)
    url = URI("https://api.monday.com/v2")

    https = Net::HTTP.new(url.host, url.port);
    https.use_ssl = true
    
    request = Net::HTTP::Get.new(url)
    request["Content-Type"] = "application/json"
    request["Authorization"] = "#{ENV['MONDAY_TOKEN']}"
    request.body = query
    response = https.request(request)
    

    parse(response)
  end

  def parse(response)
    if response.class == Net::HTTPNoContent || response.class == Net::HTTPSuccess || response.class == Net::HTTPOK
      response = JSON.parse(response.body)
      response
    else
      message = Monday::Errors.new(response)
      message
    end
  end
end