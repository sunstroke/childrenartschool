# -*- encoding : utf-8 -*-
class AddFixToGroup < ActiveRecord::Migration
  def self.up
    change_column :groups, :age_start, :integer, :default => 11
    change_column :groups, :age_finish, :integer, :default => 15          
    Group.update_all ["age_start = ?", 11]
    Group.update_all ["age_finish = ?", 15]        
    
  end

  def self.down
  end
end
