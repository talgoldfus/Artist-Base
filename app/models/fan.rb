class Fan < ApplicationRecord
  has_many :artist_fans
  has_many :artists, through: :artist_fans
  has_one :cart
  has_secure_password
  validates_presence_of :username ,:name, :city, :state
  #validates_uniqueness_of :username
  validate :unique_name

  def unique_name
    if Artist.find_by(username: self.username)
      self.errors.add(:base, "Username is already taken")
    end
  end

  def artists_in_fans_city
    Artists.where('city = ?', self.city)
  end

  def artists_in_fans_state
    Artists.where('state = ?', self.state)
  end

  def self.all_fan_items
    self.all.each_with_object([]) do |fan,other_fan_items|
      other_fan_items << fan.find_media_ids
    end
  end

  def find_media_ids
    self.cart.items.pluck(:medium_id)
  end

  def self.all_fan_items_hashed
    self.all.each_with_object({}) do |fan,other_fan_items|
      other_fan_items[fan.id]=fan.find_media_ids
    end
  end
end
