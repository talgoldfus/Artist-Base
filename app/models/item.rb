class Item < ApplicationRecord
  belongs_to :medium
  belongs_to :cart
end
