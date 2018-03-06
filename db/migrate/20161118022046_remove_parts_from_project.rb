class RemovePartsFromProject < ActiveRecord::Migration
  def change
    remove_column :projects, :iteration0, :string
    remove_column :projects, :iteration0, :string
    remove_column :projects, :iteration1, :string
    remove_column :projects, :iteration2, :string
    remove_column :projects, :iteration3, :string
    remove_column :projects, :iteration4, :string
    remove_column :projects, :first_video, :string
    remove_column :projects, :final_video, :string
    remove_column :projects, :final_report, :string
    remove_column :projects, :poster, :string
    remove_column :projects, :source_code, :string
  end
end
