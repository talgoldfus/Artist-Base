class AddUsernameToFans < ActiveRecord::Migration[5.0]
  def change
    add_column :fans, :username, :string
  end
end
