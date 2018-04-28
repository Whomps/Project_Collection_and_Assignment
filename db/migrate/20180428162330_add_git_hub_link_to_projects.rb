class AddGitHubLinkToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :github_link, :text
  end
end
