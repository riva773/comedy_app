class AddIndexUniquenessToLikes < ActiveRecord::Migration[7.1]
  def change
    add_index :likes, [ :post_id, :user_id ], unique: true
  end
end
