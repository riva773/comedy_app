class ChangeContentNullFalseOnComment < ActiveRecord::Migration[7.1]
  def change
    change_column_null :comments, :content, false
  end
end
