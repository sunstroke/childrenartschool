class AddRateToTeacher < ActiveRecord::Migration
  def self.up
    add_column :teachers, :rate, :decimal
  end

  def self.down
    remove_column :teachers, :rate
  end
end
