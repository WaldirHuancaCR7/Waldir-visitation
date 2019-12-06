class CreatePolls < ActiveRecord::Migration[6.0]
  def change
    create_table :polls do |t|
      t.references :visit, null: false, foreign_key: true
      t.text :academic_aspect
      t.text :psychological_aspect
      t.text :health_aspect
      t.text :economic_aspect
      t.text :spiritual_aspect
      t.string :evidence

      t.timestamps
    end
  end
end
