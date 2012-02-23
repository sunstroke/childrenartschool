class Slideshow < ActiveRecord::Base
  has_many :photos,  :dependent => :destroy
end
