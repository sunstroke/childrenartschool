# -*- encoding : utf-8 -*-
class SorceryCore < ActiveRecord::Migration
  def self.up
    add_column :users, :crypted_password, :string, :default => nil
    add_column :users, :salt, :string, :default => nil
    change_column :users, :email, :string, :null => false 
    change_column :people, :failure, :boolean, :default => false

  end

  def self.down
    remove_column :users, :crypted_password
    remove_column :users, :salt
  end
end
