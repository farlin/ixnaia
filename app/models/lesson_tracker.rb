class LessonTracker < ActiveRecord::Base
    
    
  # === relationships ====
  belongs_to :student, inverse_of: :lesson_trackers
  belongs_to :lesson_part, inverse_of: :lesson_trackers

  belongs_to :lesson, inverse_of: :lesson_trackers
  
  
  # === validations ====
  validates :completed_at, :presence => true
  validates :student, :presence => true
  validates :lesson_part, :presence => true
  
  validates :lesson_part, :uniqueness => { :scope=> :lesson_part_id }

  validate :completed_at_cannot_be_in_future
  def completed_at_cannot_be_in_future
    if completed_at.present? && completed_at > Date.today
      errors.add(:completed_at, "can't be in the future")
    end
  end

  
  def progress_allowed?
      
      is_allowed = false    # response
      
      lesson_attended = self.student.lesson_parts
      new_lesson = self.lesson_part

      if lesson_attended.size < 1
          
          # if this is the first lesson of this student, 
          # we allow this progress
          #
          is_allowed = true
      else
          
         # student already made some progress
         # let's take the max level of lesson_part completed
         #
         max = lesson_attended.last
         if lesson_attended.size > 1
             sorted = lesson_attended.sort_by{ |l| [l.lesson_id, l.sequence] } 
             max = sorted.last
         end
         
         # find the next lesson
         next_in_line = max.find_next
         
         if next_in_line.present? && next_in_line.id == new_lesson.id
             is_allowed = true
         end
         
      end
      
      
      is_allowed    # return
  end
end
