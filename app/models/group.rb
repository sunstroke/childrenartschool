# -*- encoding : utf-8 -*-
class Group < ActiveRecord::Base
    audited
  attr_accessible :name, :open, :program_id, :teacher_id, :price, :prim, :calendar, :label, :vk, :fb, :desc, :start, :finish, :position, :age_start, :age_finish
  belongs_to :program
  has_many :people, :class_name => "Person" ,:foreign_key => "current_group", :conditions=>["failure != ? ",true]
  belongs_to :teacher
  validates_format_of :label, :with =>/^[a-zA-Z-0-9]+$/x, :message => 'Ссылка должна содержать только строчные латинские буквы или цифры'    
  validates_uniqueness_of :label, :message => "должно быть уникальным"
  validates_presence_of :teacher_id, :message => "должен быть указан"
  validates_presence_of :program_id, :message => "должена быть указана"  
end
