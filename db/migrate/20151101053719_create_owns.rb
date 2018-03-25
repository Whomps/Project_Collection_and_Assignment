class CreateOwns < ActiveRecord::Migration[5.1]
  def change
    create_table :owns do |t|
      t.references :user, index: true
      t.references :project, index: true
    end
    add_foreign_key :owns, :users
    add_foreign_key :owns, :projects

	add_index :owns, [:user_id, :project_id], unique: true
  end
end
