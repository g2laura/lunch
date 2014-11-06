class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :user, index: true
      t.references :item, index: true
      t.references :restaurant, index: true
      t.decimal :price, precision: 8, scale: 2

      t.timestamps
    end
  end
end
