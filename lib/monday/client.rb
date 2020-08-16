class Monday::Client
  attr_accessor :token

  def initialize(params = {})
    token = params.fetch(:token)
  end

  def query
    Monday::Query.new
  end
end