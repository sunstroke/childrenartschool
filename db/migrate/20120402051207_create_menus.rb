class CreateMenus < ActiveRecord::Migration
  def self.up
    create_table :menus do |t|
      t.string :name
      t.integer :parent
      t.boolean :visible
      t.string :link
      t.integer :position
      t.timestamps
    end
  end

  def self.down
    drop_table :menus
  end
end
