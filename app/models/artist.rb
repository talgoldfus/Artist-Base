class Artist < ApplicationRecord
  has_many :artist_fans
  has_many :fans, through: :artist_fans
  has_many :image_collections
  has_many :media, through: :image_collections
  has_many :items, through: :media

  validates_presence_of :username ,:name ,:bio ,:abstract 
  validates_uniqueness_of :username 
  validates_format_of :img_link, :with => %r{\Ahttp.+\.(gif|jpe?g|png)}i, :message => "must have an image extension"


  has_secure_password

  def self.search(search)
    artist = where("name LIKE ?", "%#{search}%")
  end

  def self.most_image_collections(num)
    self.all.joins(:image_collections).group(:artist_id).order("count(artist_id) DESC").limit(num)
  end

   def self.most_favorited_artist(num)
    self.joins(:items).group(:id).order('count(artists.id) desc').limit(num)
  end

  def self.recently_favorited(num)
    Item.recently_created(num).map do |item|
      Medium.find(item.medium_id).image_collection.artist
    end.uniq
  end



end


