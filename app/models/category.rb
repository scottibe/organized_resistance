class Category < ActiveRecord::Base

  has_many :statement_categories
  has_many :statements, through: :statement_categories


end
