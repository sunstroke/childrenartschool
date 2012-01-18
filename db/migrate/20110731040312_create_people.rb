# -*- encoding : utf-8 -*-
class CreatePeople < ActiveRecord::Migration
  def self.up
    create_table :people do |t|
      t.string :fullname
      t.string :type
      t.integer :zachetka
      t.string :tel
      t.datetime :birthday
      t.text :about

      t.timestamps
    end
  end

  def self.down
    drop_table :people
  end
end
