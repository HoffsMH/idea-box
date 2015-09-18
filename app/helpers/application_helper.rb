module ApplicationHelper
  def current_user
    if session[:user]
      User.find(session[:user])
    else
      nil
    end
  end
end
