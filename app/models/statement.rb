class Statement < ActiveRecord::Base

  belongs_to :user
  belongs_to :event
  has_many :comments
  has_many :statement_categories
  has_many :categories, through: :statement_categories

  accepts_nested_attributes_for :categories

  validates_presence_of :headline, :content

  def comment_count
    self.comments.count
  end    

  def user_name
    self.try(:user).try(:name)
  end  

  def user_name=(name)
    user = User.find_or_create_by(name: name)
    self.user = user
  end    

  def categories_attributes=(category_attributes)
    category_attributes.values.each do |category_attribute|
      category = Category.find_or_create_by(category_attribute)
      self.categories << category
    end  
  end  

end
