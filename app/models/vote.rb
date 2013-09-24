class Vote < ActiveRecord::Base
  belongs_to :votable, :polymorphic => true
  belongs_to :user

  validate :check_record

  def check_record
    if Vote.exists?(:user => user, :votable => votable)
      errors.add(:base, "You have already voted.") 
    end
  end

end