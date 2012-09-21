# -*- encoding : utf-8 -*-
class Program < ActiveRecord::Base
    audited
  has_many :groups, :conditions=>['open=?',true], :order=>["position ASC"]
  has_many :teachers, :through =>:groups
end
