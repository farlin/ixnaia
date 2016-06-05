#
require 'rails_helper'

RSpec.describe LessonTracker, type: :model do

    it "is invalid without a completed_at" do
        
        tracker = LessonTracker.new(completed_at: nil)
        tracker.valid?
        expect(tracker.errors[:completed_at]).to include("can't be blank")
    end
    
    it "is invalid without a completion date" do
        
        tracker = LessonTracker.new(completed_at: nil)
        tracker.valid?
        expect(tracker.errors[:completed_at]).to include("can't be blank")
    end
    
    it "does not accept completion date in future" do
        
        tracker = LessonTracker.new(completed_at: Time.zone.now.tomorrow)
        tracker.valid?
        expect(tracker.errors[:completed_at]).to include("can't be in the future")
    end

    it "is invalid without a student" do
        
        tracker = LessonTracker.new(student: nil)
        tracker.valid?
        expect(tracker.errors[:student]).to include("can't be blank")
    end


    # actually, this is not true, so not testing it.
    # we can find a lesson from the part number, 
    #
    # it "is invalid without a lesson"

    it "is invalid without a part" do
        
        tracker = LessonTracker.new(lesson_part: nil)
        tracker.valid?
        expect(tracker.errors[:lesson_part]).to include("can't be blank")
    end

end