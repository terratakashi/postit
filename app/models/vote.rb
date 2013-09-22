class Vote < ActiveRecord::Base
  belongs_to :votable, :polymorphic => true
  belongs_to :user

  #validate :check_record

  def check_record
    errors.add(:base, "You have already voted.") if self.new_record?
  end

end