class DropPostTags < ActiveRecord::Migration[7.1]
  def change
    drop_table :post_tags
  end
end
