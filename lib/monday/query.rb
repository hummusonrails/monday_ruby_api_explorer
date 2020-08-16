require 'json'
require 'net/http'

class Monday::Query

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
    url = URI("https://api.monday.com/v2")

    https = Net::HTTP.new(url.host, url.port);
    https.use_ssl = true
    
    request = Net::HTTP::Get.new(url)
    request["Content-Type"] = "application/json"
    request["Authorization"] = "#{ENV['MONDAY_TOKEN']}"
    request.body = query

    response = https.request(request)
    puts response.read_body
  end
end

# request = "{\"query\":\"\\nquery {\\n  me {\\n    name\\n  }\\n  \\n  # boards(ids:[13542, 68097]) {\\n  boards(limit:1) {\\n    name\\n    \\n    columns {\\n      title\\n      id\\n      type\\n    }\\n    \\n    groups {\\n    \\ttitle\\n      id\\n    }\\n    \\n    items {\\n      name\\n      group {\\n        id\\n      }\\n      \\n      column_values {\\n        id\\n        value\\n        text\\n      }\\n    }\\n  }\\n}\",\"variables\":{}}"

# new_query(QUERY)