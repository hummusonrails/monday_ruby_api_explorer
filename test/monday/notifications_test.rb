require_relative './test'

class Monday::NotificationsTest < Monday::Test
  def test_instantiation
    client = Monday::Client.new(token: api_token)

    assert_kind_of Monday::Notifications, client.notifications
  end
end