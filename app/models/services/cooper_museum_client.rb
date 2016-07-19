 module Services
  class CooperMuseumClient
    include HTTParty

    BASE_URL = "https://api.collection.cooperhewitt.org/rest/?method=cooperhewitt.search.collection"
    #apikey = "aa6ebc30-4ac7-11e6-89bf-2debb3bba059"

    oauth_token = "8da9cbfca5759aeba8159963367d1e1c"

    def grab_media
        self.class.get(BASE_URL, {query: {access_token: "8da9cbfca5759aeba8159963367d1e1c",department_id: "35347493"  ,period_id:"35435409" ,page: "1",per_page: "200"}})
    end

    def grab_artist(artist_id)
        self.class.get(BASE_URL, {query: {access_token: "8da9cbfca5759aeba8159963367d1e1c",person_id: "#{artist_id}" }})
    end



  end
end







  # curl -X GET 'https://api.collection.cooperhewitt.org/rest/?method=cooperhewitt.search.collection&access_token=4f04faf4991099c45224aec524518e88&department_id=35347493&has_images=yes&period_id=35435409&page=1&per_page=200'
