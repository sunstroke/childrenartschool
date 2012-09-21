class Slideshow < ActiveRecord::Base
    audited
  has_many :photos,  :dependent => :destroy
end
