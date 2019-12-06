class CreateStudyCycles < ActiveRecord::Migration[6.0]
  def change
    create_table :study_cycles do |t|
      t.string :name

      t.timestamps
    end
  end
end
