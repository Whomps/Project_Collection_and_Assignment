class AddPeerEvaluationToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :peer_evaluation, :text
  end
end
