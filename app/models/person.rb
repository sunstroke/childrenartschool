class Person < ActiveRecord::Base
  belongs_to :group, :class_name => "Group" ,:foreign_key => "current_group"
  validates_presence_of :fullname, :message => "не может быть пустым"
  validates_presence_of :tel,  :message => "не может быть пустым"
  validates_presence_of :current_group,  :message => "должна быть выбрана"
  
end
