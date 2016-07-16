class Fan < ApplicationRecord
  has_many :artist_fans
  has_many :artists, through: :artist_fans
  has_one :cart
  has_secure_password

  validates_presence_of :username ,:name, :city, :state
  validates_uniqueness_of :username

  def artists_in_fans_city
    Artists.where('city = ?', self.city)
  end

  def artists_in_fans_state
    Artists.where('state = ?', self.state)
  end

  def self.all_fan_items
      other_fan_items = self.all.each_with_object([]) do |fan,other_fan_items|        
          other_fan_items << fan.cart.items.pluck(:medium_id)
      end
  end
end
