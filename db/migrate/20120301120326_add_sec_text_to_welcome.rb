class AddSecTextToWelcome < ActiveRecord::Migration
  def self.up
    add_column :welcomes, :second_text, :string
  end

  def self.down
    remove_column :welcomes, :second_text
  end
end
