require_relative './test'

class Monday::TagsTest < Monday::Test
  def test_instantiation
    client = Monday::Client.new(token: api_token)

    assert_kind_of Monday::Tags, client.tags
  end
end