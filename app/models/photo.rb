class Photo < ActiveRecord::Base
    audited
  mount_uploader :img, PhotoUploader
  belongs_to :slideshow
end
