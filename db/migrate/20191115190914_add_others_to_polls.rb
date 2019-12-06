class AddOthersToPolls < ActiveRecord::Migration[6.0]
  def change
    add_column :polls, :others, :text
  end
end
