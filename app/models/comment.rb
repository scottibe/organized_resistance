class Comment < ActiveRecord::Base

  belongs_to :statement
  belongs_to :user

  validates :user_id, presence: true, allow_blank: true

  def user_name
    self.user.name if self.user
  end  
end