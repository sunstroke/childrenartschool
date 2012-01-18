# -*- encoding : utf-8 -*-
class AddSubscribeToPerson < ActiveRecord::Migration
  def self.up
    add_column :people, :sub_all, :boolean
    add_column :people, :sub_group, :boolean
  end

  def self.down
    remove_column :people, :sub_group
    remove_column :people, :sub_all
  end
end
