class EventsController < ApplicationController
 
  def index
    if params[:user_id]
      @user = User.find_by(id: params[:user_id])
      if @user.nil?
        redirect_to users_path
        flash[:alert] = "User not found"
      else
        @events = @user.created_events
      end
    else      
      @past_events = Event.past_events
      @future_events = Event.future_events
    end  
  end  

  def new
    @event = Event.new 
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      redirect_to event_path(@event)
      flash[:success] = "Event Created Successfully"
    else 
      render 'new'
    end    
  end
    
  def show
    if params[:user_id]
      @user = User.find_by(id: params[:user_id])
      @event = @user.created_events.find_by(id: params[:id])
      if @event.nil?
        redirect_to user_events_path(@user)
        flash[:alert] = "Event not found"
      end  
    else  
      @event = Event.find(params[:id])
      @attending = current_user.attending_events
    end  
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
    params.require(:event).permit(:title, :street_address, :location_name, :city, :state, :title, :description, :date, :time, :creator_id, statements_attributes: [:headline, :content])
  end  

  def require_login
    return head(:forbidden) unless session.include? :user_id
  end  

end
