class Teacher < ActiveRecord::Base
    
    # === relationships ====
    has_many :klasses, inverse_of: :teacher
    
    # === validations ====
    validates :name, :presence => true
end
