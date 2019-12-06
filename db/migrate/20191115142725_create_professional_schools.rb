class CreateProfessionalSchools < ActiveRecord::Migration[6.0]
  def change
    create_table :professional_schools do |t|
      t.string :name

      t.timestamps
    end
  end
end
