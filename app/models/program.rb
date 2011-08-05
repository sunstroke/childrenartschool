class Program < ActiveRecord::Base
  has_many :groups, :conditions=>['open=?',true]
  has_many :teachers, :through =>:groups
end
