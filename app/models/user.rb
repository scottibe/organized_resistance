class User < ApplicationRecord

  has_many :posts
  has_many :events, foreign_key: 'creator_id'
  has_many :comments
  has_many :news_articles

  before_save {self.email = email.downcase }

  validates :name, :email, :password, presence: true #:city, :state, :zip, :party_affiliation
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }

  validates :email, uniqueness: true  

  validates :password, length: { minimum: 6 }


  has_secure_password(validations: false)

  def self.party
    party = ['democrat', 'independent', 'libertarian', 'liberal', 'socialist', 'fuck trump', 'fuck trump hard', 'fuck republcians', 'fuck republicans really hard']
  end 

end    
