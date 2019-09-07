class AddCategoryIdToPolls < ActiveRecord::Migration[5.0]
  def change
    add_column :polls, :category_id, :integer
  end
end
