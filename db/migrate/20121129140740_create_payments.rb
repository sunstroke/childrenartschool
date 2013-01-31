class CreatePayments < ActiveRecord::Migration
  def self.up
    create_table :payments do |t|
      t.integer :person_id
      t.integer :group_id
      t.decimal :sum
      t.string :who_received_payment

      t.timestamps
    end
  end

  def self.down
    drop_table :payments
  end
end
