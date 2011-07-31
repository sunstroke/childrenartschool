class Group < ActiveRecord::Base
  belongs_to :program
  has_many :people
end
