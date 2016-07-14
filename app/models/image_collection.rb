class ImageCollection < ApplicationRecord
  belongs_to :artist
  has_many :media
  accepts_nested_attributes_for :media, reject_if: proc {|attributes| attributes['name'].blank?}


  def self.recently_favorited(num)
    Item.recently_created(num).map do |item|
      Medium.find(item.medium_id).image_collection
    end.uniq
  end


end
