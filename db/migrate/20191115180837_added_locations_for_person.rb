class AddedLocationsForPerson < ActiveRecord::Migration[6.0]
  def change
    add_reference :people, :department, foreign_key: { to_table: 'catalogue_locations' }
    add_reference :people, :province, foreign_key: { to_table: 'catalogue_locations' }
    add_reference :people, :district, foreign_key: { to_table: 'catalogue_locations' }
  end
end
