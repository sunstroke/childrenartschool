class AddVisibleToTeacher < ActiveRecord::Migration
  def change
    add_column :teachers, :visible, :boolean
  end
end
