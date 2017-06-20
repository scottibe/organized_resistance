class Event < ActiveRecord::Base

  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
  has_many :event_attendees
  has_many :attendees, through: :event_attendees
  has_many :news_articles

end
