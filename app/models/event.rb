class Event < ActiveRecord::Base

  belongs_to :creator, class_name: 'User'
  has_many :event_attendees
  has_many :attendees, through: :event_attendees
  has_many :topics
  has_one :statement

  accepts_nested_attributes_for :topics, :statement, reject_if: lambda { |attributes| attributes['name'].blanks? }

  validates_presence_of :description, :date, :time, :street_address, :city, :state, :zip

  def topics_attributes=(topic_hash)
    topic_hash.values.each do |topic_attributes|
        self.topics.build(topic_attributes)
      end  
    end   
  end      

end