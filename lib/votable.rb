module Votable

  def self.included(base)
    base.send(:include, InstanceExtend)
    base.extend ClassExtend
    base.class_eval do
      auto_included
    end
  end

  module InstanceExtend
    def total_vote
      self.votes.where(:vote => true).size - self.votes.where(:vote => false).size
    end
  end

  module ClassExtend
    def auto_included
      has_many :votes, :as => :votable
    end
  end

end