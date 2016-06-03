class CreateLessonTrackers < ActiveRecord::Migration
  def change
    create_table :lesson_trackers do |t|
      t.belongs_to :lesson, index: true
      t.datetime :completed_at
      t.belongs_to :lesson_part, index: true
      t.belongs_to :student, index: true

      t.timestamps
    end
  end
end
