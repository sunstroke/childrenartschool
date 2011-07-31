class Welcome < ActiveRecord::Base
  require 'carrierwave/orm/activerecord'
  mount_uploader :image, ImageUploader
end
