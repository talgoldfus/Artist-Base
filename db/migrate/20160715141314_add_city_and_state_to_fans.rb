class AddCityAndStateToFans < ActiveRecord::Migration[5.0]
  def change
    add_column :fans, :city, :string
    add_column :fans, :state, :string
  end
end
