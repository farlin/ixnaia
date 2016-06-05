#
require 'rails_helper'

RSpec.describe Lesson, type: :model do
    
    it "is invalid without a title" do
        lesson = Lesson.new(title: nil)
        lesson.valid?
        expect(lesson.errors[:title]).to include("can't be blank")
    end
    
    # it "has 3 lesson parts"
end