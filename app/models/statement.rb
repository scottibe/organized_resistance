class Statement < ActiveRecord::Base

  belongs_to :user
  belongs_to :event
  has_many :comments
  has_many :users, through: :comments 
  has_many :statement_categories
  has_many :statements, through: :statement_categories

  def comment_count
    self.comments.count
  end  

  def commented_users
    self.users.uniq
  end  

  def user_name
    self.try(:user).try(:name)
  end  

  def user_name=(name)
    user = User.find_or_create_by(name: name)
    self.user = user
  end    




end
