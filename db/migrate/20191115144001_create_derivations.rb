class CreateDerivations < ActiveRecord::Migration[6.0]
  def change
    create_table :derivations do |t|
      t.string :name

      t.timestamps
    end
  end
end
