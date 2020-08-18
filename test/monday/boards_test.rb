require_relative './test'

class Monday::BoardsTest < Monday::Test
  def test_instantiation
    client = Monday::Client.new(token: api_token)

    assert_kind_of Monday::Boards, client.boards
  end
end