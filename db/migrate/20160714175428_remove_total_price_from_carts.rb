class RemoveTotalPriceFromCarts < ActiveRecord::Migration[5.0]
  def change
    remove_column :carts, :total_price, :float
  end
end
