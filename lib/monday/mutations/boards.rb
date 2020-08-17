class Monday::Mutations::Boards < Monday::HttpRequest
  def add_board(params = {})
    raise KeyError, "Missing 'board_name' parameter" unless params.fetch(:board_name)
    raise KeyError, "Missing 'board_kind' parameter" unless params.fetch(:board_kind)

    request = create_new_board_request(params)

    response = request(request, 'Post')

    response
  end

  def archive_board(board_id)
    raise KeyError, "Missing 'board_id' parameter" unless params.fetch(:board_id)

    request = {
      'query' => "mutation { archive_board (board_id: #{req[:board_id]) { id } }" 
    }

    response = request(request, 'Post')

    response
  end

  def add_subscribers(params = {})
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

  def delete_subscribers(params = {})
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

  private

  def create_new_board_request(req)
    if req[:workspace_id] || req[:template_id]
      create_new_board_request_with_options(req)
    end

    {
      'query' => "mutation { create_board (board_name: \"#{req[:board_name]}\", board_kind: #{req[:board_kind]}) { id } }" 
    }
  end

  def create_new_board_request_with_options(req)
    if req[:workspace_id] && !req[:template_id]
      {
        'query' => "mutation { create_board (
          board_name: \"#{req[:board_name]}\", 
          board_kind: #{req[:board_kind]},
          workspace_id: #{req[:workspace_id]}
          ) { id } }" 
      }
    end

    if req[:template_id] && !req[:workspace_id]
      {
        'query' => "mutation { create_board (
          board_name: \"#{req[:board_name]}\", 
          board_kind: #{req[:board_kind]},
          template_id: #{req[:template_id]}
          ) { id } }" 
      }
    end

    if req[:template_id] && req[:workspace_id]
      {
        'query' => "mutation { create_board (
          board_name: \"#{req[:board_name]}\", 
          board_kind: #{req[:board_kind]},
          workspace_id: #{req[:workspace_id]},
          template_id: #{req[:template_id]}
          ) { id } }" 
      }
    end
  end
end