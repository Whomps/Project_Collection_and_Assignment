class AddPreferenceFilledToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :preferences_filled, :boolean, :default => false
  end
end
