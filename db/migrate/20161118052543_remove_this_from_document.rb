class RemoveThisFromDocument < ActiveRecord::Migration[5.1]
  def change
    remove_column :documents, :docuploader, :string
  end
end
