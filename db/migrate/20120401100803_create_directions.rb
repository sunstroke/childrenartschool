class CreateDirections < ActiveRecord::Migration
  def self.up
    create_table :directions do |t|
      t.string :name
      t.string :link
      t.string :img
      t.text :desc
      t.integer :position
      t.boolean :visible

      t.timestamps
    end
  end

  def self.down
    drop_table :directions
  end
end
