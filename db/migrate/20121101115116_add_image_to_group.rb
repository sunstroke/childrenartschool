class AddImageToGroup < ActiveRecord::Migration
  def self.up
    add_column :groups, :img, :string
  end

  def self.down
    remove_column :groups, :img
  end
end
