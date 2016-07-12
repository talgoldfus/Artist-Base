class Cart < ApplicationRecord
  belongs_to :fan
  has_many :items
  has_many :media, through: :items
end
