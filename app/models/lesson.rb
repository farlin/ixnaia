class Lesson < ActiveRecord::Base
    
    # === relationships ====
    has_many :lesson_parts, inverse_of: :lesson
    
    # === validations ====
    validates :title, :presence => true
    validate :validate_lesson_parts 
  
    def validate_lesson_parts
      errors.add(:lesson_parts, "too many parts") if lesson_parts.size > 3
    end
end
