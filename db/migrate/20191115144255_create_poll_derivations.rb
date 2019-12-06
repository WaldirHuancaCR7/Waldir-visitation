class CreatePollDerivations < ActiveRecord::Migration[6.0]
  def change
    create_table :poll_derivations do |t|
      t.references :derivation, null: false, foreign_key: true
      t.references :poll, null: false, foreign_key: true

      t.timestamps
    end
  end
end
