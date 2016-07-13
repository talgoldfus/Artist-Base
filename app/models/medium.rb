class Medium < ApplicationRecord
  belongs_to :image_collection
  has_many :items
  has_many :carts, through: :items

  def artist
    self.image_collection.artist
  end
end
