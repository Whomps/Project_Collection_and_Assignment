class AddDocuploaderToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :docuploader, :string
  end
end
