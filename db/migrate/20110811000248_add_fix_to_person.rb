# -*- encoding : utf-8 -*-
class AddFixToPerson < ActiveRecord::Migration
  def self.up
      change_column :people, :sub_all, :boolean, :default => true
      change_column :people, :sub_group, :boolean, :default => true          
      Person.update_all ["sub_all = ?", true]
      Person.update_all ["sub_group = ?", true]        
  end

  def self.down
    
  end
end
