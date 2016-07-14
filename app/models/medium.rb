class Medium < ApplicationRecord
  belongs_to :image_collection
  has_many :items
  has_many :carts, through: :items

  def artist
    self.image_collection.artist
  end

  def self.search(search)
    medium = where("name LIKE ?", "%#{search}%")
  end

  def self.most_favorited_media(num)
    self.all.joins(:items).group('items.medium_id').order('count(items.medium_id) desc').limit(num)
  end

  def self.genres
    self.all.map { |medium| medium.genre }.uniq
  end

end
