FactoryGirl.define do
  factory :image_collection do
    name 'Louv'
    artist FactoryGirl.create :artist
    img_link "http://blabla.jpg"

  end

end

