class Monday::Client
  attr_accessor :token

  def initialize(params = {})
    token = params.fetch(:token)
  end

  def boards
    Monday::Boards.new
  end

  def columns
    Monday::Columns.new
  end

  def files
    Monday::Files.new
  end

  def groups
    Monday::Groups.new
  end

  def items
    Monday::Items.new
  end

  def notifications
    Monday::Notifications.new
  end

  def query
    Monday::Query.new
  end

  def tags
    Monday::Tags.new
  end

  def updates
    Monday::Updates.new
  end
end