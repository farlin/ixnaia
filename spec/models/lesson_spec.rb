#
require 'rails_helper'

RSpec.describe Lesson, type: :model do
    
    it "is invalid without a title" do
        lesson = Lesson.new(title: nil)
        lesson.valid?
        expect(lesson.errors[:title]).to include("can't be blank")
    end
    
    
    it "is invalid when there are more than 3 parts" do
        lesson = Lesson.new(title: 'Lesson 1')
        
        4.times do
            LessonPart.create! lesson:lesson, name: "part", sequence: 0
        end
        
        lesson.valid?
        expect(lesson.errors[:lesson_parts]).to include("too many parts")
    end

end