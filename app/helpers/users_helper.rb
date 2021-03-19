module UsersHelper
  def choose_new_or_edit_usr
    if action_name == 'new'
      users_path
    elsif action_name == 'edit'
      user_path
    end
  end
end
