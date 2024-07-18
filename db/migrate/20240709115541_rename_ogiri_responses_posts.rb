class RenameOgiriResponsesPosts < ActiveRecord::Migration[7.1]
  def change
    rename_table :ogiri_responses, :posts
  end
end
