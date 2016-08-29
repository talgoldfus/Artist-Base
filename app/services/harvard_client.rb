module Services
  class HarvardClient
    include HTTParty

    BASE_URL = "http://api.harvardartmuseums.org/object"
    #apikey = "aa6ebc30-4ac7-11e6-89bf-2debb3bba059"

    def create_artists
      self.class.get(BASE_URL, {query: {apikey: "aa6ebc30-4ac7-11e6-89bf-2debb3bba059", title: "mountains", fields: "primaryimageurl,title,people,dated,exhibitions"}})
    end
  end
end
