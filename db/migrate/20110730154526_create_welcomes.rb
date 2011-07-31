class CreateWelcomes < ActiveRecord::Migration
  def self.up
    create_table :welcomes do |t|
      t.string :name
      t.boolean :visible
      t.string :url
      t.text :text
      t.integer :position
      t.string :image

      t.timestamps
    end
  end

  def self.down
    drop_table :welcomes
  end
end
