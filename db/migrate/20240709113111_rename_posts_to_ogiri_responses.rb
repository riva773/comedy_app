class RenamePostsToOgiriResponses < ActiveRecord::Migration[7.1]
  def change
    rename_table :posts, :ogiri_responses
  end
end
