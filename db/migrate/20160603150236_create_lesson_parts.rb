class CreateLessonParts < ActiveRecord::Migration
  def change
    create_table :lesson_parts do |t|
      t.belongs_to :lesson, index: true
      t.string :name
      t.integer :sequence

      t.timestamps
    end
  end
end
