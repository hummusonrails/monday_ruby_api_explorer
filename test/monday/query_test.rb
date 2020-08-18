require_relative './test'

class Monday::QueryTest < Monday::Test
  def test_instantiation
    client = Monday::Client.new(token: api_token)

    assert_kind_of Monday::Query, client.query
  end
end