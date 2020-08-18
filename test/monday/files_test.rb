require_relative './test'

class Monday::FilesTest < Monday::Test
  def test_instantiation
    client = Monday::Client.new(token: api_token)

    assert_kind_of Monday::Files, client.files
  end
end