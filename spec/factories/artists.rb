FactoryGirl.define do
  factory :artist do
    username  do
      "artist#{rand(500..100000)}"
    end
    artist_type 'painter'
    password 'flatiron'
    name 'Leonardo Devenci'
    abstract 'I am who i am'
    bio "Some italian dude painting my life away"
    img_link "http://blabla.jpg"
  end
end
