class ChangeColumnNullToPostsOgiriTopics < ActiveRecord::Migration[7.1]
  def change
    change_column_null :posts, :ogiri_topics_id, false
  end
end
