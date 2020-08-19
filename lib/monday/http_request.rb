require 'json'
require 'net/http'
require 'dotenv'
Dotenv.load

class Monday::HttpRequest
  def request(query, type)
    url = URI("https://api.monday.com/v2")

    https = Net::HTTP.new(url.host, url.port);
    https.use_ssl = true
    
    request = Net::HTTP::Get.new(url) if type == 'Get'
    request = Net::HTTP::Post.new(url) if type == 'Post'
    request["Content-Type"] = "application/json"
    request["Authorization"] = "#{ENV['MONDAY_TOKEN']}"
    request.body = manage_query(query)
    response = https.request(request)
    

    parse(response)
  end

  def manage_query(query)
    if query.is_a?(Hash)
      query = query.collect{|k,v| [k.to_s, v]}.to_h.to_s.gsub('=>', ':')
      query
    end

    query
  end

  def parse(response)
    if response.class == Net::HTTPNoContent || response.class == Net::HTTPSuccess || response.class == Net::HTTPOK
      response = JSON.parse(response.body) unless response.body == ''
      response
    else
      message = Monday::Errors.new(response)
      message
    end
  end
end