class RemoveNameFromPreassignments < ActiveRecord::Migration[5.1]
  def change
    remove_column :preassignments, :name, :string
  end
end
