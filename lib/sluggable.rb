module Sluggable

  def self.included(base)
    base.send(:include, InstanceExtend)
    base.extend ClassExtend
    base.class_eval do
      auto_included
    end
  end

  module InstanceExtend
    def to_param
      self.slug
    end

    def generate_slug
      self.slug = self.sluggable.gsub(/\s/, "-").downcase
    end  
  end

  module ClassExtend
    def auto_included
      after_validation :generate_slug
    end
  end

end

