# -*- encoding : utf-8 -*-
class Welcome < ActiveRecord::Base
    audited
  require 'carrierwave/orm/activerecord'
  mount_uploader :image, ImageUploader
end
