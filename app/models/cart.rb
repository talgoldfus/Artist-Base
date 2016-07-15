class Cart < ApplicationRecord
  belongs_to :fan
  has_many :items
  has_many :media, through: :items


  def image_collections
    self.media.map {|medium| medium.image_collection}.uniq
  end

  def recently_added_medium
       Medium.find(self.items.last.medium_id)
  end

  def recently_added_collection
       Medium.find(self.items.last.medium_id).image_collection
  end

  def recently_added_artist
      Medium.find(self.items.last.medium_id).image_collection.artist
  end


end
