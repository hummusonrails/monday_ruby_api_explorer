class Monday::Mutations::Boards::Subscribers < Monday::HttpRequest
  def add(params = {})
    raise KeyError, "Missing 'board_id' parameter" unless params.fetch(:board_id)
    raise KeyError, "Missing 'user_ids' parameter" unless params.fetch(:user_ids)
    raise KeyError, "Missing 'kind' parameter" unless params.fetch(:kind)
    raise ArgumentError, "Expecred 'user_ids' parameter to be an Array" unless params.fetch(:user_ids).is_a?(Array)

    request = {
      'query' => "mutation { add_subscribers_to_board (
        board_id: #{params[:board_id]},
        user_ids: #{params[:user_ids]},
        kind: #{params[:kind]}
      ) { id } }" 
    }

    response = request(request, 'Post')

    response
  end

  def remove(params = {})
    raise KeyError, "Missing 'board_id' parameter" unless params.fetch(:board_id)
    raise KeyError, "Missing 'user_ids' parameter" unless params.fetch(:user_ids)
    raise ArgumentError, "Expecred 'user_ids' parameter to be an Array" unless params.fetch(:user_ids).is_a?(Array)

    request = {
      'query' => "mutation { delete_subscribers_from_board(
        board_id: #{params[:board_id]}, 
        user_ids: #{params[:user_ids]}) {
          id
        }
      }"
    }

    response = request(request, 'Post')

    response
  end
end