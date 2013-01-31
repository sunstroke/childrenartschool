class CreateLessonsLogs < ActiveRecord::Migration
  def self.up
    create_table :lessons_logs do |t|
      t.integer :group_id
      t.integer :lesson_num
      t.integer :teacher_id
      t.integer :location_id
      t.datetime :date_lesson
      t.integer :count_hours
      t.text :theme_lesson
      t.text :descript
      t.boolean :replachement
      t.decimal :replachement_pay

      t.timestamps
    end
  end

  def self.down
    drop_table :lessons_logs
  end
end
