class RemoveThisFromDocument < ActiveRecord::Migration
  def change
    remove_column :documents, :docuploader, :string
  end
end
