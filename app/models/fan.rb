class Fan < ApplicationRecord
  has_many :artist_fans
  has_many :artists, through: :artist_fans
  # has_many :carts
  has_one :cart
  has_secure_password

  validates_uniqueness_of :username

end
