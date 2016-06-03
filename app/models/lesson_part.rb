class LessonPart < ActiveRecord::Base
  belongs_to :lesson, inverse_of: :lesson_parts
end
