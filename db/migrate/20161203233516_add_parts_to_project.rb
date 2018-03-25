class AddPartsToProject < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :legacy_id, :integer
  end
end
