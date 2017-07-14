class User < ApplicationRecord

  has_many :event_attendees, foreign_key: 'attendee_id'
  has_many :attending_events, through: :event_attendees, source: :event
  has_many :created_events, class_name: 'Event', foreign_key: :creator_id
  has_many :comments
  has_many :news_articles
  has_many :statements

  before_save {self.email = email.downcase }

  validates_presence_of :name, :email 
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, format: { with: VALID_EMAIL_REGEX }

  validates :email, uniqueness: true  

  has_secure_password 

  def self.party
    party = ['democrat', 'independent', 'libertarian', 'socialist', 'I Hate Republicans']
  end 

  def logged_in?
    session[:user_id] != nil
  end  

  def self.current 
    Thread.current[:user]
  end

  def self.current=(user)
    Thread.current[:user] = user
  end  

  def statement_count
    self.statements.count
  end  

end    
