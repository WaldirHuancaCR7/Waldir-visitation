class CreateResponsibles < ActiveRecord::Migration[6.0]
  def change
    create_table :responsibles do |t|
      t.string :name
      t.references :responsible_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
