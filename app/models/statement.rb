class Statement < ActiveRecord::Base

  belongs_to :user
  belongs_to :event
  has_many :statement_topics
  has_many :topics, through: :statement_topics

end
