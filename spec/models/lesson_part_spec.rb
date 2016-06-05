#
require 'rails_helper'

RSpec.describe LessonPart, type: :model do
    
    it "is invalid without a lesson" do
        
        part = LessonPart.new(lesson: nil)
        part.valid?
        expect(part.errors[:lesson]).to include("can't be blank")
    end
    
    
    it "is invalid without a sequence" do
        
        part = LessonPart.new(sequence: nil)
        part.valid?
        expect(part.errors[:sequence]).to include("can't be blank")
    end
    
    it "does not accept sequence smaller than 1" do
        
        invalid_seq = 0
        part = LessonPart.new(sequence: invalid_seq)
        part.valid?
        expect(part.errors[:sequence]).to include("#{invalid_seq} is not a supported sequence")
    end
    
    it "does not accept sequence larger than 3" do
        
        invalid_seq = 5
        part = LessonPart.new(sequence: invalid_seq)
        part.valid?
        expect(part.errors[:sequence]).to include("#{invalid_seq} is not a supported sequence")
    end
    
    # it "is sequentially unique for each lessson"
end
