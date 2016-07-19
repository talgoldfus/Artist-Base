require 'rails_helper'

#associations
#validations
describe 'Artist' do

  #describe '#artist' do 
    let(:artist) {FactoryGirl.create :artist}

    it 'can be created' do
      expect(artist).to be_valid
    end

    it 'has a name, abstract, bio, and username' do       
      expect(artist.name).to eq(artist.name)
      expect(artist.abstract).to eq(artist.abstract)
      expect(artist.bio).to eq(artist.bio)
      expect(artist.username).to eq(artist.username)
    end

    let(:image_collection) {FactoryGirl.create :image_collection, artist: artist }
    it 'knows about its image collections' do      
      expect(artist.image_collections).to include(image_collection)
    end

    let(:medium) {FactoryGirl.create :medium, image_collection: image_collection}
    it 'knows about its media' do 
      expect(artist.media).to include(medium)
    end

    let (:item) {FactoryGirl.create :item, medium: medium}
    it 'knows about its items' do
      expect(artist.items).to include(item)
    end

  before do
    FactoryGirl.create :image_collection, artist: artist
    FactoryGirl.create :item, medium: medium
  end


  describe 'class methods' do

    describe'.most_image_collections(num)' do
      #let(:image_collection) {FactoryGirl.create :image_collection, artist: artist }
      it 'knows the artist with most image collections' do
       expect(Artist.most_image_collections(1)).to include(Artist.find artist.id)
      end
    end

    describe '.most_favorited_artist(num)' do
      it 'knows the most favorited artist' do
        expect(Artist.most_favorited_artist(1)).to include(Artist.find artist.id)
      end
    end
  

  end

#  end

end
