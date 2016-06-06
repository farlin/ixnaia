class Student < ActiveRecord::Base
    
    
    # === relationships ====
    has_many :lesson_trackers, inverse_of: :student
    has_many :lesson_parts, through: :lesson_trackers
    
    has_and_belongs_to_many :klasses
    
    # === validations ====
    validates :name, :presence => true
end
