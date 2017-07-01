class User < ApplicationRecord

  has_many :posts
  #has_many :events, foreign_key: 'creator_id'
  has_many :event_attendees, foreign_key: 'attendee_id'
  has_many :attending_events, through: :event_attendees, source: :event
  has_many :created_events, class_name: 'Event', foreign_key: :creator_id
  has_many :comments
  has_many :news_articles

  before_save {self.email = email.downcase }

  validates :name, :email, :password, presence: true #:city, :state, :zip, :party_affiliation
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, format: { with: VALID_EMAIL_REGEX }

  validates :email, uniqueness: true  

  validates :password, length: { minimum: 6 }


  has_secure_password(validations: false)

  def self.party
    party = ['democrat', 'independent', 'libertarian', 'liberal', 'socialist']
  end 

  def logged_in?
    session[:user_id] != nil
  end  

end    
