# -*- encoding : utf-8 -*-
class Page < ActiveRecord::Base
  attr_accessible :name, :label, :text, :program_type, 
  #validates_format_of :label, :with =>/^[a-zA-Z-0-9]+$/x, :message => 'Ссылка должна содержать только строчные латинские буквы или цифры'  
  #validates_uniqueness_of :label, :message => "должно быть уникальным"
      audited
end
