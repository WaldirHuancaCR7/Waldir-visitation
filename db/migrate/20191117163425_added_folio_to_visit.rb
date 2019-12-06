class AddedFolioToVisit < ActiveRecord::Migration[6.0]
  def change
    add_column :visits, :folio, :string
  end
end
