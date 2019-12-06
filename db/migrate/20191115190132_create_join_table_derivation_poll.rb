class CreateJoinTableDerivationPoll < ActiveRecord::Migration[6.0]
  def change
    create_join_table :derivations, :polls do |t|
      # t.index [:derivation_id, :poll_id]
      # t.index [:poll_id, :derivation_id]
    end
  end
end
