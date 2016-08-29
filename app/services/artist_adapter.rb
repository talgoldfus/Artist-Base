module Services
  class ArtistAdapter
    def get_media
      response = Services::CooperMuseumClient.new.grab_media
      response.parsed_response["objects"].each do |item|
        artist=Artist.create( Services::CooperMuseumClient.new.grab_artist(item["participants"].first["person_id"]))
        image_collection=ImageCollection.create( Services::CooperMuseumClient.new.grab_collection(item[]))
        medium= Medium.create(name: item["title_raw"], genre: item["type"], img_link: item["images"].first["b"]["url"] )
      end
    end
  end
end
