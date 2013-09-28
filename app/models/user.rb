class User < ActiveRecord::Base
  has_many :posts
  has_many :comments
  has_many :votes

  validates :username, :uniqueness => true
  validates :password, :presence => true, on: :create
  validates :password_confirmation, :presence => true, on: :create

  after_validation :generate_slug

  has_secure_password


  def generate_slug
    self.slug = username.downcase
  end

  #overide the default to_parm (id)  
  def to_param
    self.slug
  end

  def admin?
    role == "admin"
  end
  
end