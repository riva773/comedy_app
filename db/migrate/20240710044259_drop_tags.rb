class DropTags < ActiveRecord::Migration[7.1]
  def change
    drop_table :tags
  end
end
