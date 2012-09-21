class Photo < ActiveRecord::Base
    audited
  attr_accessible :img, :slideshow_id
  mount_uploader :img, PhotoUploader
  belongs_to :slideshow
end
