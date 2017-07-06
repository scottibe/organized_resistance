class StatementsController < ApplicationController

  def new
   @statement = Statement.new
   @event = Event.find(params[:event_id])
  end
  
  def create 
    @event = Event.find(params[:event_id])
    @event.statement = Statement.new(statement_params)
    if @event.statement.save
      redirect_to event_path(@event)
    else 
      render "new"
    end    
  end 

  def show
    @statement = Statement.find(params[:id])
  end  

  def edit 

  end 

  def update 

  end  

private 

  def statement_params
    params.require(:statement).permit(:content, :headline, :event_id)
  end  

end
