class Cart < ApplicationRecord
  belongs_to :fan
  has_many :items
  has_many :media, through: :items


  def image_collections
    self.media.map {|medium| medium.image_collection}.uniq
  end




end
