require_relative './test'

class Monday::ItemsTest < Monday::Test
  def test_instantiation
    client = Monday::Client.new(token: api_token)

    assert_kind_of Monday::Items, client.items
  end
end