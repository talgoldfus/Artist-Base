FactoryGirl.define do
  factory :fan do
    username  do 
      "Fan#{rand(500..100000)}"
    end
    password 'flatiron'
    name 'Groupie#{rand(500..100000)}'
    city 'NY'
    state 'NY'
    bio "Just another fan"
    img_link "http://blablsadasa.jpg"
  end
end


