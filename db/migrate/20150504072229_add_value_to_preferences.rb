class AddValueToPreferences < ActiveRecord::Migration[5.1]
  def change
    add_column :preferences, :value, :integer
  end
end
