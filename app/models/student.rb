class Student < ActiveRecord::Base
    has_many :lesson_trackers, inverse_of: :student
end
