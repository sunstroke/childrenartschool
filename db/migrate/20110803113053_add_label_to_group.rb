# -*- encoding : utf-8 -*-
class AddLabelToGroup < ActiveRecord::Migration
  def self.up
    add_column :groups, :label, :string
    add_column :groups, :vk, :string
    add_column :groups, :fb, :string
  end

  def self.down
    remove_column :groups, :fb
    remove_column :groups, :vk
    remove_column :groups, :label
  end
end
