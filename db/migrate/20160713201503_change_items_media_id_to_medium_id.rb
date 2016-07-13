class ChangeItemsMediaIdToMediumId < ActiveRecord::Migration[5.0]
  def change
    rename_column :items, :media_id, :medium_id
  end
end
