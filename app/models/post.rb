class Post < ActiveRecord::Base
  belongs_to :creator, :class_name => "User", :foreign_key => :user_id
  has_many :comments
  has_many :post_categories 
  has_many :categories, :through => :post_categories
  has_many :votes, :as => :votable

  validates :title, :presence => true
  validates :url, :presence => true
  validates :description, :presence => true

  def total_votes
    self.votes.where(:vote => true).size - self.votes.where(:vote => false).size
  end
  
end