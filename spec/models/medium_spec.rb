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

  describe 'Medium#most_favorited_media' do

  before do
    @lilly= FactoryGirl.create :medium, name: "water lilly" ,genre: "Classic"
    @pop= FactoryGirl.create :medium, name: "Pop" ,genre: "Pop Art"
    @mona= FactoryGirl.create :medium
    26.times {FactoryGirl.create :item  ,medium:@pop}
    13.times {FactoryGirl.create :item  ,medium:@lilly}

  end
    it 'checks to see if medium knows whats is the favorited medium' do
      expect(Medium.most_favorited_media(2).first).to eq(@pop)
    end

    it 'checks to see if medium knows whats his most recent favorited medium' do
      expect(Medium.recently_favorited(2).first).to eq(@lilly)
    end
  end


end
