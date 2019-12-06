class CreateReligiousAfilliations < ActiveRecord::Migration[6.0]
  def change
    create_table :religious_afilliations do |t|
      t.references :religion, null: false, foreign_key: true
      t.string :church
      t.string :sabbath_school_class
      t.string :baptized
      t.string :address

      t.timestamps
    end
  end
end
