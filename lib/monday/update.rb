
class Monday::Update
  def boards
    Monday::Mutations::Boards.new
  end
  
  def columns
    Monday::Mutations::Columns.new
  end

  def groups
    Monday::Mutations::Groups.new
  end

  def items
    Monday::Mutations::Items.new
  end

  def updates
    Monday::Mutations::Updates.new
  end

  def notifications
    Monday::Mutations::Notifications.new
  end

  def tags
    Monday::Mutations::Tags.new
  end

  def files
    Monday::Mutations::Files.new
  end
end