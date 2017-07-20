class StatementsController < ApplicationController
  # before_action :require_login

  def index
    if params[:user_id]
      @user = User.find_by(id: params[:user_id])
      if @user.nil?
        redirect_to users_path, alert: "Author not found"
      else 
        @statements = @user.statements
      end     
    else 
      @statements = Statement.all
    end    
  end  

  def new
   @statement = Statement.new
  end
  
  def create 
    @statement = current_user.statements.build(statement_params) 
    if @statement.save
      redirect_to statement_path(@statement)
    else 
      render "new"
    end    
  end 

  def show
    if params[:user_id]
      @user = User.find_by(id: params[:user_id])
      @statement = @user.statements.find_by(id: params[:id])
      @comment = Comment.new(statement_id: params[:statement_id])
      if @statement.nil?
        redirect_to user_statements_path(@user), alert: "Statement not found"
      end 
    else 
      @statement = Statement.find(params[:id])     
      @comment = Comment.new(statement_id: params[:statement_id])
    end  
  end  

  def edit 
    @statement = Statement.find(params[:id]) 
  end 

  def update 
    @statement = Statement.find(params[:id])
    if @statement.update(statement_params) 
      redirect_to statement_path(@statement)
    else 
      render 'edit'  
    end
  end  

private 

  def statement_params
    params.require(:statement).permit(:content, :headline, :user_name, category_ids: [], categories_attributes: [:name])
  end  



end
