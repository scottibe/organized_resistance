class UsersController < ApplicationController
 #before_action :authenticate_user

  def index 
    @users = User.all
  end   

  def new
    @user = User.new
  end

  def info
    @user = current_user
  end 

  def location_info
    @user = current_user
    @user.update(location_params)
    if @user.save 
      redirect_to @user 
    else 
      render "info" 
    end   
  end  
  
  def create 
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save 
        session[:user_id] = @user.id
        format.html { redirect_to root_path, notice: "User #{@user.name} was successfully created." }
        format.json { render :show, status: :created, location: @user }    
      else 
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end      
  end  

  def show
    @user = User.find(params[:id])
    # @events = Event.where()

  end  

  def edit
    @user.find(params[:id])
  end 
  
  def update   
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_path(@user), notice: "User #{@user.name} was successfully updated." }
        format.json { render :show, status: :created, location: @user }    
      else 
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end      
  end

  def destroy

  end  

private 

  def user_params
    params.require(:user).permit(:event_id, :name, :email, :password, :password_confirmation, :city, :state, :zip, :party_affiliation)
  end  

  def location_params
    params.require(:user).permit(:state, :zip, :city, :party_affiliation)
  end  

end
