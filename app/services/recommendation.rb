class Recommendation < ApplicationRecord
  def self.recommended_media(current_fan, num, accuracy=1)
    recommended_media = []
    while recommended_media.size < num do
      recommended_media << recommended_medium(current_fan , accuracy)
      recommended_media.uniq!
    end
    return Medium.find(recommended_media)
  end

#Retruns a random recommended medium's id of the #recommended_carts method's array
  def self.recommended_medium(current_fan, accuracy=1)
    carts = self.recommended_carts(current_fan,accuracy)
    random_recommended_cart = carts[rand(0..(carts.size-1))]
    random_recommended_cart[rand(0..(random_recommended_cart.size-1))]
  end

#Retruns a nested array of recommended media ids from other carts that have atleast one similar favorite medium
  def self.recommended_carts(current_fan, accuracy=1)
    fan_items = current_fan.cart.items.pluck(:medium_id)
    items_arr=Fan.all_fan_items.each_with_object([]) do |items,items_arr|
      # we can define the accuracy level by setting  (fan_items & items).count > accuracy for more higher number of common intrest
    accuracy=fan_items.count if accuracy > fan_items.count
      items_arr << (items - fan_items).uniq if (fan_items & items).count >= accuracy
    end
    items_arr.uniq.sort_by {|a| a.length }.reject(&:empty?)
  end

  def self.recommended_image_collection(current_fan, num, accuracy=1)
    self.recommended_media(current_fan,num,accuracy).map {|medium| medium.image_collection}
  end

  def self.recommended_artist(current_fan, num, accuracy=1)
    self.recommended_image_collection(current_fan,num,accuracy).map {|collection| collection.artist}
  end

  def self.recommended_carts_hashed(current_fan, accuracy)
    fan_items = current_fan.cart.items.pluck(:medium_id)
    items_arr=Fan.all_fan_items_hashed.each_with_object([]) do |(fan_id,items),items_arr|
      accuracy = fan_items.count if accuracy > fan_items.count
        items_arr << {fan_id => ((items - fan_items).uniq)}  if ((fan_items & items).count >= accuracy) && !((items - fan_items).uniq).empty?
    end
      items_arr.uniq.reject(&:empty?)
  end

  def self.top_similar_fan(current_fan)
    accuracy = current_fan.cart.items.count
    until !recommended_carts_hashed(current_fan, accuracy).empty?
      accuracy -= 1
    end
    Fan.find(recommended_carts_hashed(current_fan, accuracy).first.keys.first)
  end

  def self.top_recommended_media_art(current_fan)
    self.top_similar_fan(current_fan).media
  end
end
