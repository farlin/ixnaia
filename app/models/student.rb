class Student < ActiveRecord::Base
    has_many :lesson_trackers, inverse_of: :student
    has_many :lesson_parts, through: :lesson_trackers
end
