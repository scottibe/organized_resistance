class StatementsController < ApplicationController

  def index
    if params[:user_id]
      @statements = User.find_by(id: params[:user_id]).statements
    elsif params[:event_id]
      @statements = Event.find_by(id: params[:event_id]).statements
    else
      @statements = Statement.all 
    end    
  end  

  def new
   @statement = Statement.new
  end
  
  def create 
    @statement = current_user.statements.build(statement_params) 
    if @statement.save!
      redirect_to statement_path(@statement)
    else 
      render "new"
    end    
  end 

  def show
    if params[:user_id]
      @user = User.find_by(id: params[:user_id])
      @statement = @user.statements.find_by(id: params[:id])
      @comment = Comment.new(statement: params[:statement_id])
    elsif params[:event_id]   
      @statement = Statement.find_by(id: params[:id])
      @statement.event = Event.find(params[:id])
      @comment = Comment.new(statement: params[:statement_id])
    else 
      @statement = Statement.find(params[:id])      
      @comment = Comment.new(statement: params[:statement_id])
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

  def destroy
    @statement = Statement.find(params[:id])
    @statement.destroy

    redirect_to user_path(current_user)
  end  

private 

  def statement_params
    params.require(:statement).permit(:event_id, :content, :headline, :user_name, category_ids: [], categories_attributes: [:name])
  end     

end
