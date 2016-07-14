class AddCityAndStateToArtists < ActiveRecord::Migration[5.0]
  def change
    add_column :artists, :city, :string
    add_column :artists, :state, :string
  end
end
