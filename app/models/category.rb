class Category < ActiveRecord::Base
  include Sluggable
  
  alias_attribute :sluggable, :name

  has_many :post_categories
  has_many :posts, :through => :post_categories

  validates :name, :presence => true, :uniqueness => true

  after_validation :generate_slug
  
end