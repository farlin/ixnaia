class Klass < ActiveRecord::Base
  
  # === relationships ====
  belongs_to :teacher, inverse_of: :klasses
  
  has_and_belongs_to_many :students
  
  # === validations ====
  validates :name, :presence => true
  validates :teacher, :presence => true
end
