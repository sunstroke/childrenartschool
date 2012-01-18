# -*- encoding : utf-8 -*-
class AddProgramtypeToPage < ActiveRecord::Migration
  def self.up
    add_column :pages, :program_type, :string
  end

  def self.down
    remove_column :pages, :program_type
  end
end
