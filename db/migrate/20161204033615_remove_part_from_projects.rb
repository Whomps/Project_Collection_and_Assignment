class RemovePartFromProjects < ActiveRecord::Migration[5.1]
  def change
    remove_column :projects, :year, :date
  end
end
