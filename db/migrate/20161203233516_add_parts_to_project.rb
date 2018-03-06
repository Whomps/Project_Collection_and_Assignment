class AddPartsToProject < ActiveRecord::Migration
  def change
    add_column :projects, :legacy_id, :integer
  end
end
