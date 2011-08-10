class Program < ActiveRecord::Base
  has_many :groups, :conditions=>['open=?',true], :order=>["position ASC"]
  has_many :teachers, :through =>:groups
end
