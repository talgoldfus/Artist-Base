require 'rails_helper'
require 'pry'

RSpec.describe ImageCollection, type: :model do 
  
  describe '#artist' do 
    let(:artist) {FactoryGirl.create :artist }
    let(:image_collection) { FactoryGirl.create :image_collection ,artist:artist}
    
    it 'checks to see if image collection  knows about its artist' do 
      expect(image_collection.artist).to eq(artist)
    end
  end


  describe 'ImageCollection#recently_favorited' do 

  before do
    @pop_art= FactoryGirl.create :image_collection
    @lilly= FactoryGirl.create :medium, name: "water lilly" ,genre: "Classic" 
    @pop= FactoryGirl.create :medium, name: "Pop" ,image_collection: @pop_art
    FactoryGirl.create :item  ,medium:@lilly
    FactoryGirl.create :item  ,medium:@pop

    
  end

    it 'checks to see if image collection knows whats his most recent favorited medium' do 
      expect(ImageCollection.recently_favorited(2).first).to eq(@pop_art)
    end
  end
 
  
end









