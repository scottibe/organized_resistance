class Topic < ActiveRecord::Base

  has_many :statement_topics
  has_many :statements, through: :statement_topics

end
