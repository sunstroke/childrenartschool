class Slideshow < ActiveRecord::Base
    # audited
  has_many :photos,  :dependent => :destroy
  attr_accessible :name, :theme_id 
end
