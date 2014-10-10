class DropCategoriesTable < ActiveRecord::Migration
  def change
#    remove_column :items, :category_id
    drop_table :categories
  end
end
