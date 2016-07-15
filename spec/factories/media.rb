FactoryGirl.define do
  factory :medium do
    name 'Mona Lisa'
    genre 'Classic'
    image_collection  FactoryGirl.create :image_collection
    # user: FactoryGirl.create :user
    img_link "http://blabla.jpg"
  end

end


