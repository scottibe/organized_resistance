module UsersHelper

  def display_user(statement)
    statement.user.nil? ? 'Anonymous' : link_to(statement.user_name, user_path(statement.user))
  end

end
