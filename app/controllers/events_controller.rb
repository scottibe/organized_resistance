class EventsController < ApplicationController
  before_action :require_login  #,  except: [:index]
 
  def index
    @events = Event.all
  end  

  def new
    @event = Event.new
    @topics = @event.topics.build 
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save!
      redirect_to event_path(@event)
    else 
      render 'new'
    end    
  end
                  # FIX topic can't just choose topic, need to enter one in text box
  def show
    # if params[:statement_id]
    #   @statement = Statement.find_by(id: params[:id])
    # end  
    @event = Event.find(params[:id])
    @topics = @event.topics
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
    params.require(:event).permit(:title, :street_address, :location_name, :zip, :city, :state, :title, :description, :date, :time, :creator_id, topic_ids: [], topics_attributes: [:name])
  end  

  def require_login
    return head(:forbidden) unless session.include? :user_id
  end  

end
