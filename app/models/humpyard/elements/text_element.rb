module Humpyard
  module Elements 
    ####
    # Humpyard::Elements::TextElement is a model of a text element.    
    class TextElement < ::ActiveRecord::Base
      acts_as_humpyard_element :system_element => true
      
      attr_accessible :content
      
      require 'globalize'
      
      translates :content
      validates_presence_of :content
    end
  end
end