class Location < ActiveRecord::Base
  has_many :lessons_logs
end
