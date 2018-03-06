class AddPartToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :year, :string
  end
end
