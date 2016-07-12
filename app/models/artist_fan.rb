class ArtistFan < ApplicationRecord
  belongs_to :artist
  belongs_to :fan
end
