class AddStyleToWelcomes < ActiveRecord::Migration
  def self.up
    add_column :welcomes, :style_text, :string
    add_column :welcomes, :style_second_text, :string
  end

  def self.down
    remove_column :welcomes, :style_second_text
    remove_column :welcomes, :style_text
  end
end
