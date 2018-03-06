class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.boolean :is_legacy
      t.boolean :is_file
      t.string :name
      t.string :doc_type
      t.integer :project_id
      t.datetime :date
      t.string :author
      t.string :link

      t.timestamps null: false
    end
  end
end
