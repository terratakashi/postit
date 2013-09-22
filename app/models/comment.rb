class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :creator, :class_name => "User", :foreign_key => :user_id
  has_many :votes, :as => :votable

  validates :body, :presence => true

end