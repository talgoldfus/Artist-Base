class CreateArtists < ActiveRecord::Migration[5.0]
  def change
    create_table :artists do |t|
      t.string :name
      t.text :abstract
      t.text :bio
      t.string :artist_type 
      
      t.timestamps
    end
  end
end
