class CreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.string :code
      t.references :person, null: false, foreign_key: true
      t.references :professional_school, null: false, foreign_key: true
      t.references :study_cycle, null: false, foreign_key: true
      t.references :study_group, null: false, foreign_key: true
      t.references :religion, null: false, foreign_key: true
      t.string :address
      t.string :reference
      t.integer :student_type
      t.boolean :urgent
      t.string :lat
      t.string :lng
      t.string :photo

      t.timestamps
    end
  end
end
