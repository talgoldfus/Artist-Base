FactoryGirl.define do
  factory :item do
    cart FactoryGirl.create :cart
    medium FactoryGirl.create :medium
  end

end

