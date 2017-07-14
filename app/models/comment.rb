class Comment < ActiveRecord::Base

  belongs_to :statement
  belongs_to :user

  accepts_nested_attributes_for :user, reject_if: :all_blank

  validates :user_id, presence: true, allow_blank: true

  def user_name
    self.user.name if self.user
  end  
end