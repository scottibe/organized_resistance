class StatementCategory < ActiveRecord::Base

  belongs_to :statement 
  belongs_to :category

end
