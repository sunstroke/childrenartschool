class AddTelParentToPeople < ActiveRecord::Migration
  def change
    add_column :people, :tel_mother, :string
    add_column :people, :email_mother, :string
    add_column :people, :tel_father, :string
    add_column :people, :email_father, :string
  end
end
