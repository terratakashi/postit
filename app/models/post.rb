class Post < ActiveRecord::Base
  include Votable
  include Sluggable
  alias_attribute :sluggable, :title

  belongs_to :creator, :class_name => "User", :foreign_key => :user_id
  has_many :comments
  has_many :post_categories 
  has_many :categories, :through => :post_categories

  validates :title, :presence => true
  validates :url, :presence => true
  validates :description, :presence => true

end