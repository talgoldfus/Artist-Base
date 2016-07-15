require "rails_helper"
require "pry"

RSpec.describe Cart, type: :model do
  before do
    @cart = FactoryGirl.create :cart
    @medium1 = FactoryGirl.create :medium
    @medium2 = FactoryGirl.create :medium
    @medium3 = FactoryGirl.create :medium
    @item1 = Item.create(cart_id: @cart.id, medium_id: @medium1.id)
    @item2 = Item.create(cart_id: @cart.id, medium_id: @medium2.id)
    @item3 = Item.create(cart_id: @cart.id, medium_id: @medium3.id)
  end
  describe "Associations" do
    it 'belongs to the correct fan' do
      expect(@cart.fan).to eq(Fan.last)
    end

    it "has many items" do
      expect(@cart.items).to include(@item2)
    end

    it "has many media through items" do
      expect(@cart.media).to include(@medium3)
    end
  end
  describe "#image_collections" do
    it "can find its image collections" do
      expect(@cart.image_collections).to include(@medium2.image_collection)
    end
  end

  describe "#recently_added_medium" do
    it 'can find the most recently added medium' do
      expect(@cart.recently_added_medium).to eq(@medium3)
    end
  end

  describe "#recently_added_collection" do
    it 'can find the most recently added collection' do
      expect(@cart.recently_added_collection).to eq(@medium3.image_collection)
    end
  end

  describe "#recently_added_artist" do
    it "can find the most recently added artist" do
      expect(@cart.recently_added_artist).to eq(@medium3.artist)
    end
  end
  # def recently_added_medium
  #      Medium.find(self.items.last.medium_id)
  # end
  #
  # def recently_added_collection
  #      Medium.find(self.items.last.medium_id).image_collection
  # end
  #
  # def recently_added_artist
  #     Medium.find(self.items.last.medium_id).image_collection.artist
  # end
end
