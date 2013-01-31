class CreateAttendances < ActiveRecord::Migration
  def self.up
    create_table :attendances do |t|
      t.integer :lessonslog_id
      t.integer :group_id
      t.integer :person_id
      t.boolean :attendance
      t.boolean :lateness
      t.string :reason

      t.timestamps
    end
  end

  def self.down
    drop_table :attendances
  end
end
