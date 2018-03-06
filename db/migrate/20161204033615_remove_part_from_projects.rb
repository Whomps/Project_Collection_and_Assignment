class RemovePartFromProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :year, :date
  end
end
