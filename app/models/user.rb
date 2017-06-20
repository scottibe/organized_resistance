class User < ApplicationRecord

  has_many :posts
  has_many :events, foreign_key: 'creator_id'
  has_many :attendee_events, foreign_key: 'attendee_id'
  has_many :attending_events, through: :attendee_events, source: :event
  has_many :created_events, foreign_key: 'creator_id', source: :event
  has_many :comments
  has_many :news_articles

  before_save {self.email = email.downcase }

  validates :name, :email, :password, presence: true #:city, :state, :zip, :party_affiliation
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, format: { with: VALID_EMAIL_REGEX }

  validates :email, uniqueness: true  

  # validates :password, length: { minimum: 6 }


  has_secure_password(validations: false)

  def self.party
    party = ['democrat', 'independent', 'libertarian', 'liberal', 'socialist']
  end 

end    
