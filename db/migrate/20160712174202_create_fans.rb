class CreateFans < ActiveRecord::Migration[5.0]
  def change
    create_table :fans do |t|
      t.string :name
      t.text :bio

      t.timestamps
    end
  end
end
