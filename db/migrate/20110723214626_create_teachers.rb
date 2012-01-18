# -*- encoding : utf-8 -*-
class CreateTeachers < ActiveRecord::Migration
  def self.up
    create_table :teachers do |t|
      t.string :fullname
      t.string :link
      t.text :about
      t.integer :portfolio_id
      t.text :video

      t.timestamps
    end
  end

  def self.down
    drop_table :teachers
  end
end
