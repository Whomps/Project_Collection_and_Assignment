class AddHerokuToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :heroku_link, :text
  end
end
