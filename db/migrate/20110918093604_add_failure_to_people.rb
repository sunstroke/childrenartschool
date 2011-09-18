class AddFailureToPeople < ActiveRecord::Migration
  def self.up
    add_column :people, :failure, :boolean
  end

  def self.down
    remove_column :people, :failure
  end
end
