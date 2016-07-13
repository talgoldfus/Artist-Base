class Artist < ApplicationRecord
  has_many :artist_fans
  has_many :fans, through: :artist_fans
  has_many :image_collections
  has_many :media, through: :image_collections
  has_many :items, through: :media

  has_secure_password

end
