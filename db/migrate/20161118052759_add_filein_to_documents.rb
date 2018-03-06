class AddFileinToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :filein, :string
  end
end
