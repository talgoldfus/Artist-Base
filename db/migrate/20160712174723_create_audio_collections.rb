class CreateAudioCollections < ActiveRecord::Migration[5.0]
  def change
    create_table :audio_collections do |t|
      t.string :name
      t.integer :artist_id

      t.timestamps
    end
  end
end
