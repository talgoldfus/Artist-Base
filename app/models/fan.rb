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
    other_fan_items = []
      Fan.all.each do |fan|        
          other_fan_items << fan.cart.items.pluck(:medium_id)
      end
      
      new_arr = []
      other_fan_items.map do |items|
          new_arr << (items - fan_items).uniq        
        end
    
    new_arr = (new_arr.sort_by { |a| a.length }).reject(&:empty?)
    Medium.find new_arr.first[0]

  end

end
