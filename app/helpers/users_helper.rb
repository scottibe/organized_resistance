module UsersHelper

  def display_user(statement)
    statement.user.nil? ? link_to("Add Author", edit_statement_path(statement)) : link_to(statement.user_name, user_path(statement.user))
  end

end
