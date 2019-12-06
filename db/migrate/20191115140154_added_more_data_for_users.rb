class AddedMoreDataForUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :user_type, :integer
    add_column :users, :active, :boolean
  end
end
