class AddSemyearToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :semester, :string
    add_column :projects, :year, :string
  end
end
