class AddColumnToPosts < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :content, :text, null: false
    add_column :ogiri_topics, :content, :text, null: false
  end
end
