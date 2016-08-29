module Services
  class CooperArtistAdapter

    def self.artist_abstract(roles)
      roles.map do |hash|
        hash.map {|k,v| v if k == "name"}
      end.join(" ")
    end

    def self.genre(department_id)
      case department_id
        when "35347493"
          return "DRAWINGS,PRINTS, AND GRAPHIC DESIGN"
        when "35347497"
          return "PRODUCT DESIGN AND DECORATIVE ARTS"
        when "35347501"
          return "TEXTILES"
        when "35347503"
          return "WALLCOVERINGS"
        when "35518655"
          return "DIGITAL"
        when "35347485"
          return "ARCHIVES"
      end
    end

    def self.bio(artist)
      if artist["biography"]
        return artist["biography"]
      else
        return "#{artist["name"]}'s bio is pending"
      end
    end

    def set_artist(medium_id, person_id)
      media = Services::CooperMuseumClient.new.grab_media(medium_id, person_id).parsed_response["objects"]
      artist = Services::CooperMuseumClient.new.grab_artist(person_id).parsed_response["person"]
      new_artist=Artist.create(username: artist["name"].split.join.downcase , password:"flatiron",name: artist["name"],abstract: Services::CooperArtistAdapter.artist_abstract(artist["roles"]), bio: Services::CooperArtistAdapter.bio(artist))
      image_collection = ImageCollection.create(name: media.first["medium"], artist_id: new_artist.id)
      media.each do |item|
        unless item["images"].first.nil? || item["images"].first["b"].nil?
          medium= Medium.create(name: item["title"],
            genre: Services::CooperArtistAdapter.genre(item["department_id"]),
            image_collection_id: image_collection.id,
            img_link: item["images"].first["b"]["url"])
        end
      end
      image_collection.randomize_profile_picture
      image_collection.save
    end
  end
end
