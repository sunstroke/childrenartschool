class Program < ActiveRecord::Base
  has_many :groups
  has_many :teachers, :through =>:groups
end
