require_relative './test'

class Monday::UpdatesTest < Monday::Test
  def test_instantiation
    client = Monday::Client.new(token: api_token)

    assert_kind_of Monday::Updates, client.updates
  end
end