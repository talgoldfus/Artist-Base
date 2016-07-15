require 'rails_helper'
require 'pry'

RSpec.describe Medium, type: :model do 
  
  describe 'Knows about his collection' do 
    let(:image_collection) { FactoryGirl.create :image_collection}
    let(:medium) {FactoryGirl.create :medium,image_collection:image_collection}
    
    it 'checks to see if medium knows about his collection' do 
      expect(medium.image_collection).to include(image_collection)
    end
  end

  describe '#artist' do 
    let(:artist) {FactoryGirl.create :artist }
    let(:image_collection) { FactoryGirl.create :image_collection ,artist:artist}
    let(:medium) {FactoryGirl.create :medium,image_collection:image_collection}
    
    it 'checks to see if medium knows about its artist' do 
      expect(medium.artist).to eq(artist)
    end
  end

  describe 'Medium#genres' do 

  before do
     FactoryGirl.create :medium, genre: "Classic" 
     FactoryGirl.create :medium, genre: "Pop Art" 
     FactoryGirl.create :medium, genre: "Dada" 
  end
    it 'checks to see if medium knows about all the current genres' do 
      expect(Medium.genres).to eq(["Classic","Pop Art","Dada"])
    end
  end
 
  
end




