class AddImgLinkToMedia < ActiveRecord::Migration[5.0]
  def change
    add_column :media, :img_link, :string
  end
end
