class Monday::Errors
  attr_accessor :response

  def initialize(response)
    @response = response

    parse_response!(self.response)
  end

  def parse_response!(response)
    if response.class == Net::HTTPBadRequest
      bad_request_error
    end

    if response.class == Net::HTTPUnauthorized
      unauthorized_error
    end

    other_error(response)
  end

  def unauthorized_error
    puts <<~RESPONSE
      Your token is invalid or not being submitted in your API request.
      Please make sure that your token is valid and is included in the HTTP request.
    RESPONSE
  end

  def bad_request_error
    puts <<~RESPONSE
      You have submitted an invalid GraphQL query. 
      Please view our documentation or use our API playground to build your query.
    RESPONSE
  end

  def other_error(response)
    puts <<~RESPONSE
      Something went wrong, but not sure what. Here is what was returned by the API:
      #{response.code}: #{response.message}
    RESPONSE
  end
end