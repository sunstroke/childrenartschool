# -*- encoding : utf-8 -*-
class Welcome < ActiveRecord::Base
  require 'carrierwave/orm/activerecord'
  mount_uploader :image, ImageUploader
end
