class AddAgeToGroups < ActiveRecord::Migration
  def self.up
    add_column :groups, :age_start, :integer
    add_column :groups, :age_finish, :integer
  end

  def self.down
    remove_column :groups, :age_finish
    remove_column :groups, :age_start
  end
end
