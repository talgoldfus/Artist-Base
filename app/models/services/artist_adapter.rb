module Services
  class ArtistAdapter
    def get_artists#(artist_name)
      response = Services::HarvardClient.new.create_artists
        i = Artist.all.count + 1    
      response.parsed_response["records"].each do |item|
        Artist.create(name: item["people"][0]["name"], bio: "testing", abstract: "testing", username: "artist#{i}", 
          password: "flatiron", img_link: item["primaryimageurl"])
        i += 1        
      end
    end
  end
end


# module Services
#   class ArtistAdapter
#     def get_artists#(artist_name)
#       response = Services::HarvardClient.new.create_artists
#         i = Artist.all.count + 1    
#       response.parsed_response["records"].each do |item|
#         Artist.create(name: item["people"][0]["name"], bio: "testing", abstract: "testing", username: "artist#{i}", 
#           password: "flatiron", img_link: item["primaryimageurl"])
#         i += 1        
#       end
#     end
#   end
# end


