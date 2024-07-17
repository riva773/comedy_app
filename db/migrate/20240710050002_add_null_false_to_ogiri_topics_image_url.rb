class AddNullFalseToOgiriTopicsImageUrl < ActiveRecord::Migration[7.1]
  def change
    change_column_null :ogiri_topics, :image_url, false
  end
end
