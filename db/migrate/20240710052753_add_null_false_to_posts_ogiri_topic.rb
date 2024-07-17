class AddNullFalseToPostsOgiriTopic < ActiveRecord::Migration[7.1]
  def change
    change_column_null :posts, :ogiri_topic_id, false
  end
end
