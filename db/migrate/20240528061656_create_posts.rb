class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.references :user, foreign_key: true, null: false
      t.string :content, null: false
      t.integer :genre
      t.integer :privacy, null: false, default: 0

      t.timestamps

    end
  end
end
