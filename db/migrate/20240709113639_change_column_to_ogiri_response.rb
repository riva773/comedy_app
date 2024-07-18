class ChangeColumnToOgiriResponse < ActiveRecord::Migration[7.1]
  def change
    remove_column :ogiri_responses, :genre, :integer
    remove_column :ogiri_responses, :privacy, :integer
    rename_column :ogiri_responses, :content, :img_url
    add_reference :ogiri_responses, :ogiri_topics, foreign_key: true
  end
end
