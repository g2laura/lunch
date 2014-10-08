class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.text :description
      t.string :slogan
      t.string :phone_number
      t.string :email
      t.text :address
      t.string :twitter
      t.string :instagram
      t.string :facebook
      t.string :website
      t.boolean :delivery

      t.timestamps
    end
  end
end
