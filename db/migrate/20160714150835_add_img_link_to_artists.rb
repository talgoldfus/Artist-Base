class AddImgLinkToArtists < ActiveRecord::Migration[5.0]
  def change
    add_column :artists, :img_link, :string
  end
end
