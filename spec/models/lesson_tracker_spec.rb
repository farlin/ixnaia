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
        
        tracker = LessonTracker.new(completed_at: Date.tomorrow)
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
    
    it "does not allow duplicate lessons" do
        lesson = Lesson.create!(title: 'Lesson 1')
        lesson_part_i = LessonPart.create! lesson:lesson, name: "part 1", sequence: 1
        student = Student.create! name: "Cookie"
        
        tracker = LessonTracker.create!(completed_at: Date.today, student: student, lesson_part: lesson_part_i)
        tracker_two = LessonTracker.new(completed_at: Date.today, student: student, lesson_part: lesson_part_i)
        
        tracker_two.valid?
        expect(tracker_two.errors[:lesson_part]).to include("has already been taken")
    end
    
    #
    describe "calculates progress" do

        before :all do
            @lesson = Lesson.new(title: 'Lesson 1')
            @lesson_part_i = LessonPart.create! lesson:@lesson, name: "part 1", sequence: 1
            @lesson_part_ii = LessonPart.create! lesson:@lesson, name: "part 2", sequence: 2
            @lesson_part_iii = LessonPart.create! lesson:@lesson, name: "part 3", sequence: 3
            @lesson.save!

            @lesson_two = Lesson.new(title: 'Lesson 2')
            @lesson_two_part_i = LessonPart.create! lesson:@lesson_two, name: "part 1", sequence: 1
            @lesson_two_part_ii = LessonPart.create! lesson:@lesson_two, name: "part 2", sequence: 2
            @lesson_two_part_iii = LessonPart.create! lesson:@lesson_two, name: "part 3", sequence: 3
            @lesson_two.save!

        end

        before :each do
            LessonTracker.destroy_all
            @student = Student.create! name: "Elmo"
        end

        it "by allowing first lesson to be set as any part" do
            #
            tracker = LessonTracker.new(completed_at: Date.today, student: @student, lesson_part: @lesson_two_part_ii)
            res = tracker.progress_allowed?
            expect(res).to be true
        end

        it "by allowing second lesson only to be sequential from first" do
            #
            tracker = LessonTracker.create!(completed_at: Date.today, student: @student, lesson_part: @lesson_part_i)
            tracker_second = LessonTracker.new(completed_at: Date.today, student: @student, lesson_part: @lesson_part_ii)

            res = tracker_second.progress_allowed?
            expect(res).to be true
        end

        it "by restricting lesson part skips" do
            #
            tracker = LessonTracker.create!(completed_at: Date.today, student: @student, lesson_part: @lesson_part_ii)
            tracker_second = LessonTracker.new(completed_at: Date.today, student: @student, lesson_part: @lesson_two_part_ii)

            res = tracker_second.progress_allowed?
            expect(res).to be false
        end

        it "by restricting lesson part reverts" do
            #
            tracker = LessonTracker.create!(completed_at: Date.today, student: @student, lesson_part: @lesson_two_part_iii)
            tracker_second = LessonTracker.new(completed_at: Date.today, student: @student, lesson_part: @lesson_two_part_ii)

            res = tracker_second.progress_allowed?
            expect(res).to be false
        end
    end



    after(:suite) do
      Lesson.delete_all
      LessonPart.delete_all
      LessonTracker.delete_all
    end
end