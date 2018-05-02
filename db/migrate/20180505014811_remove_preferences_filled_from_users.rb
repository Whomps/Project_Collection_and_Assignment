class RemovePreferencesFilledFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :preferences_filled, :boolean, :default => false
  end
end
