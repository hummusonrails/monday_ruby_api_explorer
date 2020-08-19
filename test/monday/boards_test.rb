require_relative './test'

class Monday::BoardsTest < Monday::Test
  def test_instantiation
    assert_kind_of Monday::Boards, client.boards
  end

  def test_create_method
    ENV['MONDAY_TOKEN'] = api_token
    
    stub_request(:post, uri).with(
      headers: {
        'Authorization'=> api_token,
        'Content-Type'=>'application/json'
      },
      body: "{\"query\":\"mutation { create_board (board_name: \\\"example new board\\\", board_kind: public) { id } }\"}").to_return(status: 200)
    
    response = client.boards.create(
      board_name: 'example new board',
      board_kind: 'public'
    )

    assert 200, response.code
  end
end