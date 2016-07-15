class RemoveQuantityFromMedia < ActiveRecord::Migration[5.0]
  def change
    remove_column :media, :quantity, :integer
  end
end
