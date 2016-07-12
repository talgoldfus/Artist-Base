class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.integer :cart_id
      t.integer :media_id

      t.timestamps
    end
  end
end
