class Menu < ActiveRecord::Base
    audited
acts_as_list  
  attr_accessible :name, :parent, :visible, :link, :position
  has_many :children, :class_name => "Menu", :foreign_key => "parent"
  belongs_to :head, :class_name => "Menu"
  
end
