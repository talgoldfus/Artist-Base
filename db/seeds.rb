##artists
Artist.destroy_all
10.times do 
   Artist.create(name: Faker::Name.name, abstract: Faker::ChuckNorris.fact, 
    bio: Faker::Hacker.say_something_smart, password: "flatiron", 
    username: Faker::Internet.email, artist_type: "Photographer")
end

##fans
Fan.destroy_all
20.times do 
  fan =Fan.create(name: Faker::Name.name, bio: Faker::ChuckNorris.fact, 
    password: "flatiron", username: Faker::Internet.email)
  fan.cart=Cart.create()
  fan.save
end

##image collections
word_arr = %w[Tampflex Opela Wrapsafe Kanlam Greenlam Lotlux Cardguard Treeflex Temp Job Domainer Tampflex Redhold Solarbreeze Viva Voyatouch Matsoft Cardify Sub-Ex Lotstring]

ImageCollection.destroy_all
n = 0
20.times do 
  ImageCollection.create(name: word_arr[n], artist_id: rand(1..10))
  n += 1
end

##media 
genre_arr = ["Horror", "Humor", "Biography/Autobiography", "Comic/Graphic", "Novel", "Western", "Science", "Fiction"]

Medium.destroy_all
n = 0
50.times do 
  Medium.create(name: Faker::Name.name, price: rand(100..1000), 
    quantity: rand(1..100), genre: genre_arr[n], image_collection_id: rand(1..20))
    n = 0 if n >= 8
end






