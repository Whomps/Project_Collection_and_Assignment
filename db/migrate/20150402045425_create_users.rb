class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :uin
      t.string :email
      t.string :year
      t.string :semester
      t.string :course

      t.timestamps null: false
    end
  end
end
