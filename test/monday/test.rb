require 'minitest/autorun'
require 'webmock/minitest'
require_relative '../../lib/monday'

module Monday
  class Test < Minitest::Test
    def api_token
      "eyJhbGciOiJIUzI1NiJ9.eyJ0bWQiOjY5Ndeo3ij0J1aWQiOjE1NTQwMzk3LCJpYWQiOJt6IKLMnPqDEwOjA1OjEzLjAwMFoiLCJwZXIiOiJtZTp3cml0ZSJ9.BB2Kg6SioaZ5bjO6qWYd74ISI3Yflefi306t4dkd2d"
    end

    def request_headers
      {
        'Content-Type' => 'application/json',
        'Authorization' => api_token
      }
    end

    def uri
      'https://api.monday.com/v2'
    end

    def client
      Monday::Client.new(token: api_token)
    end
  end
end