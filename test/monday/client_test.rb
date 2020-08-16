require_relative './test'

class Monday::ClientTest < Monday::Test
  def test_initialize_success
    client = Monday::Client.new(token: api_token)

    assert client
  end

  def test_initialize_failure_no_token
    assert_raises { Monday::Client.new }
  end

  def test_query_instance_method
    client = Monday::Client.new(token: api_token)

    assert_kind_of Monday::Query, client.query
  end
end