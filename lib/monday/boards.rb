class Monday::Boards
  def new
    Monday::Mutations::Boards.add_board(params = {})
  end

  def archive
    Monday::Mutations::Boards.new.archive_board(board_id)
  end

  def add_subscribers
    Monday::Mutations::Boards::Subscribers.new.add_subscribers(params = {})
  end

  def delete_subscribers
    Monday::Mutations::Boards::Subscribers.new.delete_subscribers(params = {})
  end
end