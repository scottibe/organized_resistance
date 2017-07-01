class EventsController < ApplicationController
 
  def index
    @events = Event.all
  end  

  def new
    @events = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      redirect_to event_path(@event)
    else 
      render 'new'
    end    
  end

  def show
    @event = Event.find(params[:id])
    #@creator = User.find(session[:user_id])
    #raise "createor".inspect  
  end

  def update
  end

  def edit
  end

  def destroy
  end

private 

  def event_params
    params.require(:event).permit(:title, :subject, :description, :date, :time, :location, :creator_id)
  end  

end
