class AddImageCollectionIdToMedia < ActiveRecord::Migration[5.0]
  def change
    add_column :media, :image_collection_id, :integer
  end
end
