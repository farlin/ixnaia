class CreateKlasses < ActiveRecord::Migration
  def change
    create_table :klasses do |t|
      t.string :name
      t.belongs_to :teacher, index: true
      t.belongs_to :student, index: true

      t.timestamps
    end
  end
end
