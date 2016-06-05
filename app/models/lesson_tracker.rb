class LessonTracker < ActiveRecord::Base
    
    
  # === relationships ====
  belongs_to :student, inverse_of: :lesson_trackers
  belongs_to :lesson_part, inverse_of: :lesson_trackers

  belongs_to :lesson, inverse_of: :lesson_trackers  # purely for reference purposes - TODO: remove
  
  
  # === validations ====
  validates :completed_at, :presence => true
  validates :student, :presence => true
  validates :lesson_part, :presence => true

  validate :completed_at_cannot_be_in_future
  def completed_at_cannot_be_in_future
    if completed_at.present? && completed_at > Date.today
      errors.add(:completed_at, "can't be in the future")
    end
  end
  
  
end
