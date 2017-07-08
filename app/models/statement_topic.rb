class StatementTopic < ActiveRecord::Base

  belongs_to :statement 
  belongs_to :topic

end
