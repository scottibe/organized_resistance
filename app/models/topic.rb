class Topic < ActiveRecord::Base

  belongs_to :event

  validates :name, presence: true
  #validates :name, :uniqueness => true



end
