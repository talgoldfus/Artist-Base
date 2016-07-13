class AddPasswordDigestToFans < ActiveRecord::Migration[5.0]
  def change
    add_column :fans, :password_digest, :string
  end
end
