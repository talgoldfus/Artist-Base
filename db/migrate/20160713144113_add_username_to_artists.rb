class AddUsernameToArtists < ActiveRecord::Migration[5.0]
  def change
    add_column :artists, :username, :string
  end
end
