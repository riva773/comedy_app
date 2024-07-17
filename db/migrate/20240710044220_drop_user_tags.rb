class DropUserTags < ActiveRecord::Migration[7.1]
  def change
    drop_table :user_tags
  end
end
