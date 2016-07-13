class AddPasswordDigestToArtists < ActiveRecord::Migration[5.0]
  def change
    add_column :artists, :password_digest, :string
  end
end
