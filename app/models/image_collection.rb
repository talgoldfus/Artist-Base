class ImageCollection < ApplicationRecord
  belongs_to :artist
  has_many :media
end
