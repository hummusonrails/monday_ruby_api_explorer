require_relative './test'

class Monday::GroupsTest < Monday::Test
  def test_instantiation
    client = Monday::Client.new(token: api_token)

    assert_kind_of Monday::Groups, client.groups
  end
end