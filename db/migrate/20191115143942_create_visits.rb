class CreateVisits < ActiveRecord::Migration[6.0]
  def change
    create_table :visits do |t|
      t.references :student, null: false, foreign_key: true
      t.datetime :visit_date
      t.datetime :closing_date
      t.integer :status
      t.datetime :scheduled_date
      t.datetime :visit_date_finished

      t.timestamps
    end
  end
end
