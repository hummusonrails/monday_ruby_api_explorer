require_relative './test'

class Monday::ColumnsTest < Monday::Test
  def test_instantiation
    client = Monday::Client.new(token: api_token)

    assert_kind_of Monday::Columns, client.columns
  end
end