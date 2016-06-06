class AddRelationShipBetweenClassStudent < ActiveRecord::Migration
  def up
      remove_reference :klasses, :student
      
      create_join_table :klasses, :students do |t|
        t.index [:klass_id, :student_id]
        t.index [:student_id, :klass_id]
      end
  end
  def down
      add_reference :klasses, :student
      drop_table :klasses_students
  end
end
