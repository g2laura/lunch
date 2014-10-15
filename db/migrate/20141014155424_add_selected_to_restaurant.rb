class AddSelectedToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :selected, :boolean, default: false
  end
end
