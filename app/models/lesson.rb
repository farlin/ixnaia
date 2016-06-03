class Lesson < ActiveRecord::Base
    has_many :lesson_parts, inverse_of: :lesson
end
