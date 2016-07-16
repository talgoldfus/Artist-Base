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

  def self.recommended_medium(current_fan)
    fan_items = current_fan.cart.items.pluck(:medium_id)

    items_arr = []
    self.all_fan_items.map do |items|
        items_arr << (items - fan_items).uniq        
      end
    
    Medium.find items_arr.sort_by { |a| a.length }.reject(&:empty?).first[0]
  end

  def self.all_fan_items
      other_fan_items = []
      Fan.all.map do |fan|        
          other_fan_items << fan.cart.items.pluck(:medium_id)
      end
      other_fan_items
  end
end
