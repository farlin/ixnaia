class LessonPart < ActiveRecord::Base
    
    
    
    # === relationships ====
    belongs_to :lesson, inverse_of: :lesson_parts
    has_many :lesson_trackers, inverse_of: :lesson_parts
    
  
    # === validations ====
    validates :sequence, :presence => true
    validates :lesson, :presence => true
    
    validates :sequence, inclusion: { in: [1, 2, 3], message: "%{value} is not a supported sequence" }

    def find_next
        # if we are under the assumption that it is all ordered by id::
        # next_in_line = LessonPart.where("id > ?", self.id).first
        next_in_line = LessonPart.where("sequence > ?", self.sequence).where(:lesson_id => self.lesson_id).first
        next_in_line ||= LessonPart.where(:sequence => 1).where( "lesson_id > ?", self.lesson_id).first
    end
end
