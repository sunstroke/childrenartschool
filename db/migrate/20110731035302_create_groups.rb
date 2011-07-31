class CreateGroups < ActiveRecord::Migration
  def self.up
    create_table :groups do |t|
      t.string :name
      t.boolean :open
      t.integer :program_id
      t.integer :teacher_id
      t.decimal :price, :precision => 8, :scale => 0
      t.text :prim
      t.text :calendar

      t.timestamps
    end
  end

  def self.down
    drop_table :groups
  end
end
