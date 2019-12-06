class AddedColumnsToStudent < ActiveRecord::Migration[6.0]
  def change
    add_column :students, :church, :string
    add_column :students, :sabbath_school_class, :string
    add_column :students, :baptized, :boolean
    add_column :students, :church_adresss, :string
  end
end
