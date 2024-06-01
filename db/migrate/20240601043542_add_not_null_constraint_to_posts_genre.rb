class AddNotNullConstraintToPostsGenre < ActiveRecord::Migration[7.1]
  def change
    change_column_null :posts, :genre, false
  end
end
