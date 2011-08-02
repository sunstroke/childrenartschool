class Group < ActiveRecord::Base
  belongs_to :program
  has_many :people, :class_name => "Person" ,:foreign_key => "current_group"
  belongs_to :teacher
end
