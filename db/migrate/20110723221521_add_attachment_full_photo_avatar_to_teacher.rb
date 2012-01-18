# -*- encoding : utf-8 -*-
class AddAttachmentFullPhotoAvatarToTeacher < ActiveRecord::Migration
  def self.up
    add_column :teachers, :full_photo_file_name, :string
    add_column :teachers, :full_photo_content_type, :string
    add_column :teachers, :full_photo_file_size, :integer
    add_column :teachers, :full_photo_updated_at, :datetime
    add_column :teachers, :avatar_file_name, :string
    add_column :teachers, :avatar_content_type, :string
    add_column :teachers, :avatar_file_size, :integer
    add_column :teachers, :avatar_updated_at, :datetime
  end

  def self.down
    remove_column :teachers, :full_photo_file_name
    remove_column :teachers, :full_photo_content_type
    remove_column :teachers, :full_photo_file_size
    remove_column :teachers, :full_photo_updated_at
    remove_column :teachers, :avatar_file_name
    remove_column :teachers, :avatar_content_type
    remove_column :teachers, :avatar_file_size
    remove_column :teachers, :avatar_updated_at
  end
end
