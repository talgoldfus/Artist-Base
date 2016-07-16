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

#Retruns a list of X recommended media of a given fan 

  def self.recommended_media(current_fan,num)
      recommended_media=[]
      while recommended_media.size<num do  
        recommended_media<< recommended_medium(current_fan)
        recommended_media.uniq!
      end
      return Medium.find(recommended_media)
  end

#Retruns a random recommended medium's id of the the #recommended_carts method's array
  def self.recommended_medium(current_fan)
    carts=self.recommended_carts(current_fan)
    random_recommended_cart= carts[rand(0..(carts.size-1))]
    andom_recommended_item=random_recommended_cart[rand(0..(random_recommended_cart.size-1))]
  end

#Retruns a nested array of recommended media ids from other carts that have atleast one similar favorite medium
  def self.recommended_carts(current_fan)
    fan_items = current_fan.cart.items.pluck(:medium_id)
    items_arr=self.all_fan_items.each_with_object([]) do |items,items_arr|
      items_arr << (items - fan_items).uniq  if !((fan_items & items).empty?)  
    end
    items_arr.sort_by {|a| a.length }.reject(&:empty?)
  end

  def self.all_fan_items
      other_fan_items = self.all.each_with_object([]) do |fan,other_fan_items|        
          other_fan_items << fan.cart.items.pluck(:medium_id)
      end
  end
end
