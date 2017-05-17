class RemoveCategoryIdFromLink < ActiveRecord::Migration[5.0]
  def change
    remove_column :links, :category_id
  end
end
