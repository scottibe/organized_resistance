class EventAttendeesController < ApplicationController

  def create
    @event = Event.find(params[:event_id])
    @event_attendee = current_user.event_attendees.build(event: @event)
    @event.attendees << @event_attendee.attendee
    redirect_to user_path(current_user)
  end 

end  