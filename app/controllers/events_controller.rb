class EventsController < ApplicationController
  #before_action :require_login  #,  except: [:index]
 
  def index
    @past_events = Event.past_events
    @future_events = Event.future_events
  end  

  def new
    @event = Event.new 
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save!
      redirect_to event_path(@event)
    else 
      render 'new'
    end    
  end
    
  def show
    @event = Event.find(params[:id])
    @attending = current_user.attending_events
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to event_path(@event)
    else 
      render "edit"
    end    
  end

  def edit
    @event = Event.find(params[:id])
  end

  def destroy
  end

private 

  def event_params
    params.require(:event).permit(:title, :street_address, :location_name, :zip, :city, :state, :title, :description, :date, :time, :creator_id)
  end  

  def require_login
    return head(:forbidden) unless session.include? :user_id
  end  

end
