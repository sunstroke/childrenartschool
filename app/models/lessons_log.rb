class LessonsLog < ActiveRecord::Base
  has_many :attendance
  has_one :group
  has_one :teacher
  has_one :location
end
