require 'json'
require 'net/http'

class Monday::Query < Monday::HttpRequest

  # Make a new query request
  #
  # @return JSON
  # 
  # @example
  #   results = Monday::Query.new_query("{
  #   \"query\":
  #     \"\\nquery {
  #       \\n  me {
  #         \\n    name\\n  
  #         }\\n  boards(limit:1) {
  #           \\n    name\\n    \\n    
  #           columns {\\n      
  #             title\\n      
  #             id\\n      
  #             type\\n    
  #           }\\n    \\n    
  #           groups {\\n    \\
  #             ttitle\\n      
  #             id\\n    
  #           }\\n    \\n    
  #           items {\\n      
  #             name\\n      
  #             group {\\n        
  #               id\\n      
  #             }\\n      \\n      
  #           column_values {\\n        
  #             id\\n        
  #             value\\n        
  #             text\\n      
  #           }\\n    
  #         }\\n  
  #       }\\n
  #     }\",
  #     \"variables\":{}
  #   }")

  def new_query(query)
    response = request(query)

    response
  end
end