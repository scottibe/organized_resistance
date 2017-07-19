class SessionsController < ApplicationController

  def new
  end 
  
  def create 
    if auth_hash = request.env["omniauth.auth"] 
      oauth_email = auth["info"]["email"]
      oauth_name = auth["info"]["name"]
      if user = User.find_by(email: oauth_email)
        session[:user_id] = user.id 
        redirect_to user_path(user)
      else 
        user = User.new(email: oauth_email, name: oauth_name, password: SecureRandom.hex)
        user.save
        session[:user_id] = user.id
        redirect_to user_info_path(user)
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
    session.delete :user_id 
    flash[:success] = "You Have Logged Out, Goodbye" 
    redirect_to login_path
  end   

end
