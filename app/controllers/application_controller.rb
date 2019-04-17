class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index

  end

  def current_user
    id = cookies["logged_user"]
    id
  end

  def is_user_logged_in?
    user = User.find(cookies["logged_user"].to_i)
	  if user
      true
    else redirect_to root_path
    end
  end
end