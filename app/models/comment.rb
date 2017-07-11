class Comment < ActiveRecord::Base

  belongs_to :statement
  belongs_to :user

  accepts_nested_atrributes_for :user, reject_if :all_blank

end

  def user_name
    self.user.name if self.user
  end  

  validates :user_id, presence: true, allow_blank: true