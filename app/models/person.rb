# -*- encoding : utf-8 -*-
class Person < ActiveRecord::Base
    audited
  attr_accessible   :fullname, :role_type, :zachetka, :tel, :birthday, :about, :current_group, :mail, :sub_all, :sub_group, :failure
  belongs_to :group, :class_name => "Group" ,:foreign_key => "current_group"
  validates_presence_of :fullname, :message => "не может быть пустым"
  validates_presence_of :tel,  :message => "не может быть пустым"
  validates_presence_of :current_group,  :message => "должна быть выбрана"
  #validates_format_of :mail, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i , :message => "не верный формат"
  
end
