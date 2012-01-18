# -*- encoding : utf-8 -*-
class FixColumnNameForProgram < ActiveRecord::Migration
  def self.up
    rename_column :programs, :type, :program_type
    rename_column :people, :type, :role_type    
  end

  def self.down
    rename_column :programs, :program_type, :type
    rename_column :people, :role_type, :type
  end
end
