class Event < ActiveRecord::Base

  belongs_to :creator, class_name: 'User'
  has_many :event_attendees
  has_many :attendees, through: :event_attendees
  has_one :statement 

  accepts_nested_attributes_for :statement

  validates_presence_of :title, :description, :date, :time, :street_address, :city, :state

  def self.past_events
    self.where("date < ?", Time.now.beginning_of_day)
  end  

  def self.future_events
    self.where("date > ?", Time.now.beginning_of_day)
  end   

  def self.in_state_events
    self.where("state = ?", User.current.state)
  end

  def attending?
    User.current.attending_events.include?(self)
  end   

end