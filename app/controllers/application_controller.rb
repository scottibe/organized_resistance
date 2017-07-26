class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :set_current_user
  rescue_from ActiveRecord::RecordNotFound, :with => :render_404

  def render_404
    render :template => "errors/error_404", :status => 404
  end



  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end  

  def logged_in?
    !!current_user
  end 

  def authenticate_user
    redirect_to root_path if !logged_in?
  end   

  def set_current_user
    User.current = current_user
  end   

  def require_login
    return head(:forbidden) unless session.include? :user_id
  end

  helper_method :current_user, :logged_in?, :require_login

end
