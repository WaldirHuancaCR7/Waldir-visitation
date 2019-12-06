class CreateCatalogueLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :catalogue_locations do |t|
      t.string :name
      t.integer :parent_id
      t.integer :catalogue_type

      t.timestamps
    end
  end
end
