# -*- encoding : utf-8 -*-
class AddMailToPerson < ActiveRecord::Migration
  def self.up
    add_column :people, :mail, :string
  end

  def self.down
    remove_column :people, :mail
  end
end
