class Attendance < ActiveRecord::Base
  has_one :lessons_log
  has_one :person
end
