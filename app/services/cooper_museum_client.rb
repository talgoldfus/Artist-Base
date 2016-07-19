module Services
  class CooperMuseumClient
    include HTTParty

    #apikey = "aa6ebc30-4ac7-11e6-89bf-2debb3bba059"

    access_token = "8da9cbfca5759aeba8159963367d1e1c"

    def grab_media(medium_id, person_id)
        url = "https://api.collection.cooperhewitt.org/rest/?method=cooperhewitt.people.getObjects"
        self.class.get(url, {query: {access_token: "8da9cbfca5759aeba8159963367d1e1c", medium_id: medium_id ,person_id: person_id ,page: "1",per_page: "100"}})
    end

    def grab_artist(person_id)
        url = "https://api.collection.cooperhewitt.org/rest/?method=cooperhewitt.people.getInfo"
        self.class.get(url, {query: {access_token: "8da9cbfca5759aeba8159963367d1e1c",person_id: person_id }})
    end

  end
end