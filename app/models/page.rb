class Page < ActiveRecord::Base
  validates_format_of :label, :with =>/^[a-zA-Z-0-9]+$/x, :message => 'Ссылка должна содержать только строчные латинские буквы или цифры'  
end
