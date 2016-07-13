class ImageCollection < ApplicationRecord
  belongs_to :artist
  has_many :media
  accepts_nested_attributes_for :media, reject_if: proc {|attributes| attributes['name'].blank?}

end
