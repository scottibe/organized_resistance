class SessionsController < ApplicationController

  def new
    
  end 
  
  def create 
    if auth_hash = request.env["omniauth.auth"] 
      oauth_email = request.env["omniauth.auth"]["info"]["email"]
      if user = User.find_by(email: oauth_email)
        session[:user_id] = user.id 
        redirect_to user_path(user)
      else 
        user = User.create(email: oauth_email)
        session[:user_id] = user.id
        redirect_to user_path(user)
      end     
    else        
      user = User.find_by(email: params[:email])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id 
        redirect_to user_path(user)
      else 
       redirect_to login_path    
      end 
    end  
  end  

  def auth
    request.env['omniauth.auth']
  end 

  def destroy
    session[:user_id] = nil 
    redirect_to login_path, notice: "Logged out"
  end   

end
