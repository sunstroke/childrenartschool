# -*- encoding : utf-8 -*-
class AddStartToGroup < ActiveRecord::Migration
  def self.up
    add_column :groups, :start, :datetime
    add_column :groups, :finish, :datetime
    add_column :groups, :position, :integer    
  end

  def self.down
    remove_column :groups, :finish
    remove_column :groups, :start
    remove_column :groups, :position    
  end
end
