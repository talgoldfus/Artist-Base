require_relative "../app/models/services/cooper_museum_client.rb"
require_relative "../app/models/services/cooper_artist_adapter.rb"



Artist.destroy_all

#henrydreyfuss

Services::CooperArtistAdapter.new.set_artist("35389857","18041501")
henrydreyfuss = Artist.find_by(username: "henrydreyfuss")
henrydreyfuss.img_link = "https://images.collection.cooperhewitt.org/22093_57c13e777f4d599d_b.jpg"
henrydreyfuss.save


#Edward McKnight Kauffer
Services::CooperArtistAdapter.new.set_artist("35421785","18041923")
edwardmcknightkauffer = Artist.find_by(username: "edwardmcknightkauffer")
edwardmcknightkauffer.img_link = "https://upload.wikimedia.org/wikipedia/commons/4/4c/Raymond_McIntyre_-_Edward_McKnight_Kauffer_-_Google_Art_Project.jpg"
edwardmcknightkauffer.save

#ART CHANTRY

Services::CooperArtistAdapter.new.set_artist("35519927","18041683")
artchantry= Artist.find_by(username: "artchantry")
artchantry.img_link = "https://gabrielchetcuti.files.wordpress.com/2013/12/art-chantry-3.jpg"
artchantry.save




#ALICE CORDELIA MORSE
Services::CooperArtistAdapter.new.set_artist("35421785","18060579")
alicecordeliamorse= Artist.find_by(username: "alicecordeliamorse")
alicecordeliamorse.img_link = "https://s-media-cache-ak0.pinimg.com/236x/1b/35/7a/1b357aa0124e6fc9466fd798e1873de3.jpg"
alicecordeliamorse.save


# KARIN ZONIS
Services::CooperArtistAdapter.new.set_artist("51496397","51676457")
karinzonis= Artist.find_by(username: "karinzonis")
karinzonis.img_link = "https://mlsvc01-prod.s3.amazonaws.com/2a75681e001/682a49b6-90d9-4ebf-936f-2ab3c0df2a6a.jpg?ver=1439438969000"
karinzonis.save


# GREGORY HERRINGSHAW
Services::CooperArtistAdapter.new.set_artist("35428249","18047399")
gregoryherringshaw= Artist.find_by(username: "gregoryherringshaw")
gregoryherringshaw.img_link = "https://mlsvc01-prod.s3.amazonaws.com/2a75681e001/682a49b6-90d9-4ebf-936f-2ab3c0df2a6a.jpg?ver=1439438969000"
gregoryherringshaw.save


# ALEXANDRA EXTER
Services::CooperArtistAdapter.new.set_artist("35432333","18042743")
alexandraexter= Artist.find_by(username: "alexandraexter")
alexandraexter.img_link = "https://upload.wikimedia.org/wikipedia/commons/7/72/Alexandra_Exter.jpg"
alexandraexter.save



##artists
#Faker::Avatar.image("my-own-slug", "50x50")
img = 1
i = 0

CITIES = ["New York City","Boston","Los Angeles","Philidelphia","Miami","Portland","Seattle","San Francisco","Chicago"]

STATES = ["New York", "Massachusetts", "California", "Pennsylvania", "Florida", "Oregon", "Washington", "California", "Illinois"]



##fans
Fan.destroy_all
20.times do
  fan =Fan.create(name: Faker::Name.name, bio: Faker::ChuckNorris.fact,
    password: "flatiron", username: Faker::Internet.email,
    img_link: Faker::Avatar.image("image#{img}", "200x200"),
    city: CITIES[i - 1], state: STATES[i - 1])
  img += 1
  i += 1
  i = 0 if i >= CITIES.length
  fan.cart=Cart.create()
  fan.save
end

##@items
Item.destroy_all
100.times do
  Item.create(cart_id: rand((Cart.first.id)..(Cart.last.id)), medium_id: rand((Medium.first.id)..(Medium.last.id)))
end



