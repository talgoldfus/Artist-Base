class AddImgLinkToImageCollections < ActiveRecord::Migration[5.0]
  def change
    add_column :image_collections, :img_link, :string
  end
end
