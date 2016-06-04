class LessonTracker < ActiveRecord::Base
    
    
  # === relationships ====
  belongs_to :lesson, inverse_of: :lesson_trackers
  belongs_to :lesson_part, inverse_of: :lesson_trackers
  belongs_to :student, inverse_of: :lesson_trackers
  
  
  # === validations ====
  validates :student, :presence => true
  validates :lesson_part, :presence => true
  
  
end
