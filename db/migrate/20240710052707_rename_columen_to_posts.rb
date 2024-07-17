class RenameColumenToPosts < ActiveRecord::Migration[7.1]
  def change
    remove_reference :posts, :ogiri_topics
    add_reference :posts, :ogiri_topic, foreign_key: true
  end
end
