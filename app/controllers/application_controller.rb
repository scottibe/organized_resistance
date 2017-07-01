class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception



  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end  

  def logged_in?
    !!current_user
  end 

  def authenticate_user
    redirect_to root_path if !logged_in?
  end   

  helper_method :current_user, :logged_in?

end
