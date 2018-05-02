class AddPreferenceFilledToTeams < ActiveRecord::Migration[5.1]
  def change
    add_column :teams, :preferences_filled, :boolean, :default => false
  end
end
