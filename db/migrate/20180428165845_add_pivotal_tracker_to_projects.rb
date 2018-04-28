class AddPivotalTrackerToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :pivotal_link, :text
  end
end
