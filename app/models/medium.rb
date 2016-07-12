class Medium < ApplicationRecord
  belongs_to :image_collection
  has_many :items
  has_many :carts, through: :items
  has_one :artist, through: :image_collection
end
