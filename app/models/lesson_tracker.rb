class LessonTracker < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :lesson_part
  belongs_to :student
end
