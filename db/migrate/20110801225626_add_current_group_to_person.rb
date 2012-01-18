# -*- encoding : utf-8 -*-
class AddCurrentGroupToPerson < ActiveRecord::Migration
  def self.up
    add_column :people, :current_group, :integer
  end

  def self.down
    remove_column :people, :current_group
  end
end
