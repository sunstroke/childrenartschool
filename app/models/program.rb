# -*- encoding : utf-8 -*-
class Program < ActiveRecord::Base
    audited
  attr_accessible :name, :annotation, :program_type, :position, :duration  
  has_many :groups, :conditions=>['open=?',true], :order=>["position ASC"]
  has_many :teachers, :through =>:groups
end
