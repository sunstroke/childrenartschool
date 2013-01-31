class Payment < ActiveRecord::Base
  has_one :person
  has_one :group
end
