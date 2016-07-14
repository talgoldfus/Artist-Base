class AddImgLinkToFans < ActiveRecord::Migration[5.0]
  def change
    add_column :fans, :img_link, :string
  end
end
