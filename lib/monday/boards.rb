class Monday::Boards
  def new
    Monday::Mutations::Boards.add_board(params = {})
  end

  def archive
    Monday::Mutations::Boards.new.archive_board(board_id)
  end

  def subscribers
    Monday::Mutations::Boards::Subscribers.new
  end
end