require 'json'
require 'net/http'

class Monday::Query < Monday::HttpRequest

  # Make a new query request
  #
  # Your query can be provided in a Hash with the key being 'query'.
  # The key in the Hash argument can either be a Symbol or a String.
  #
  # The value of the 'query' key must be a String that starts with the
  # word query and an open curly brace:
  # "query {"
  # 
  # The end of your query ends with a closing curly brace still enclosed
  # in the string:
  # "}"
  #
  # @return JSON
  #
  # @example
  #   results = Monday::Query.new_query({query: "query { me { name } }"})
  def new_query(query)
    response = request(query)

    response
  end
end