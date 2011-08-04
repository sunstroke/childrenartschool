class Group < ActiveRecord::Base
  belongs_to :program
  has_many :people, :class_name => "Person" ,:foreign_key => "current_group"
  belongs_to :teacher
  validates_format_of :label, :with =>/^[a-zA-Z-0-9]+$/x, :message => 'Ссылка должна содержать только строчные латинские буквы или цифры'    
  validates_uniqueness_of :label, :message => "должно быть уникальным"
end
