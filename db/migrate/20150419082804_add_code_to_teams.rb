class AddCodeToTeams < ActiveRecord::Migration[5.1]
  def change
    add_column :teams, :code, :string
  end
end
