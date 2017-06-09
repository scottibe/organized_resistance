class User < ApplicationRecord

  # has_many :posts, foreign_key: 'author_id'
  # has_many :events, foreign_key: 'creator_id'
  # has_many :comments

  before_save {self.email = email.downcase }

  validates :first_name, :last_name, :email, :password, presence: true  #:city, :state, :zip, :party_affiliation, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }

  validates :email, uniqueness: true  

  validates :password, length: { in: 6..20 } 
  

  has_secure_password

  def self.party
    party = ['democrat', 'independent', 'libertarian', 'liberal', 'socialist', 'fuck trump', 'fuck trump hard', 'fuck republcians', 'fuck republicans really hard']
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid 
      user.name = auth.info.name 
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end  
  end  
  
end
