class AddDocuploaderToDocuments < ActiveRecord::Migration[5.1]
  def change
    add_column :documents, :docuploader, :string
  end
end
