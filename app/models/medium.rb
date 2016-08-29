class Medium < ApplicationRecord
  belongs_to :image_collection
  has_many :items
  has_many :carts, through: :items

  validates_presence_of :name ,:genre
  validates_format_of :img_link, :with => /\Ahttp.+\.(gif|jpe?g|png)/i , :message => "must have an image extension"

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

  def self.recently_favorited(num)
    Item.recently_created(num).map do |item|
      self.find(item.medium_id)
    end.uniq
  end
end
