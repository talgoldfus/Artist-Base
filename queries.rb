most favorited media
"select media.name, count(media.name) from Media join Items on media.id = items.medium_id group by items.medium_id order by count(items.medium_id) desc"

artist with most image collections
"select artists.name, count(artists.name) from image_collections join artists on artists.id = image_collections.artist_id group by artists.name order by count(image_collections.artist_id) desc"


def self.most_image_collections
  self.all.joins(:image_collections).group(:artist_id).order("count(image_collection_id)")
end


most liked artist

step 1
collection  = "select media.image_collection_id from Media join Items on media.id = items.medium_id group by items.medium_id order by count(items.medium_id) desc limit 1 "

step 2
"select artists.name from image_collections join artists where artists.id = collection[0][0]"

most recent artist - can be used for media, collection, etc
select artists.name from artists order by created_at desc limit 1



