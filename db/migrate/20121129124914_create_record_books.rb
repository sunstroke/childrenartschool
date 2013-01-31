class CreateRecordBooks < ActiveRecord::Migration
  def self.up
    create_table :record_books do |t|
      t.integer :person_id
      t.integer :group_id
      t.decimal :price
      t.decimal :payment_all
      t.string :contract
      t.boolean :is_contract
      t.string :status


      t.timestamps
    end
  end

  def self.down
    drop_table :record_books
  end
end
