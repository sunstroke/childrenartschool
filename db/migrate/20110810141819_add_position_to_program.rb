# -*- encoding : utf-8 -*-
class AddPositionToProgram < ActiveRecord::Migration
  def self.up
    add_column :programs, :position, :integer
    add_column :programs, :duration, :integer    
  end

  def self.down
    remove_column :programs, :position
    remove_column :programs, :duration    
  end
end
