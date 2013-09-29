class Comment < ActiveRecord::Base
  include Votable
  belongs_to :post
  belongs_to :creator, :class_name => "User", :foreign_key => :user_id

  validates :body, :presence => true

end