class User < ActiveRecord::Base
  include Sluggable
  alias_attribute :sluggable, :username

  has_many :posts
  has_many :comments
  has_many :votes

  validates :username, :uniqueness => true
  validates :password, :presence => true, on: :create
  validates :password_confirmation, :presence => true, on: :create

  after_validation :generate_slug

  has_secure_password

  def admin?
    role == "admin"
  end
  
end