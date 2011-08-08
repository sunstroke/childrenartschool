class AddDescToGroup < ActiveRecord::Migration
  def self.up
    add_column :groups, :desc, :string
  end

  def self.down
    remove_column :groups, :desc
  end
end
