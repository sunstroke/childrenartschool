# -*- encoding : utf-8 -*-
class Welcome < ActiveRecord::Base
    # audited
  attr_accessible :name, :url, :text, :image, :position, :visible, :second_text , :style_text, :style_second_text
  require 'carrierwave/orm/activerecord'
  mount_uploader :image, ImageUploader
end
