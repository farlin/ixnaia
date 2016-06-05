class LessonPart < ActiveRecord::Base
    
    
    
    # === relationships ====
    belongs_to :lesson, inverse_of: :lesson_parts
    has_many :lesson_trackers, inverse_of: :lesson_parts
    
  
    # === validations ====
    validates :sequence, :presence => true
    validates :lesson, :presence => true
    
    validates :sequence, inclusion: { in: [1, 2, 3], message: "%{value} is not a supported sequence" }
end
