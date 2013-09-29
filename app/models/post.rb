class Post < ActiveRecord::Base
  include Votable
  belongs_to :creator, :class_name => "User", :foreign_key => :user_id
  has_many :comments
  has_many :post_categories 
  has_many :categories, :through => :post_categories

  validates :title, :presence => true
  validates :url, :presence => true
  validates :description, :presence => true

  after_validation :generate_slug

  def generate_slug
    self.slug = title.gsub(/\s/, "-").downcase
  end  
  
  #overide the default to_parm (id)  
  def to_param
    self.slug
  end

end