class Photo < ActiveRecord::Base
  
  mount_uploader :img, PhotoUploader
  belongs_to :slideshow
end
