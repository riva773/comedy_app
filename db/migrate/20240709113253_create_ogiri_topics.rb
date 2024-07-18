class CreateOgiriTopics < ActiveRecord::Migration[7.1]
  def change
    create_table :ogiri_topics do |t|
      t.string :image_url
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
