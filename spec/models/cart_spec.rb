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
  describe "knows which fan it belongs to" do
    it 'belongs to the correct fan' do
      expect(@cart.fan).to eq(Fan.last)
    end


    it "has many items" do
      expect(@cart.items).to include(@item2)
    end

    it "has many media through items" do
      binding.pry
      expect(@cart.media).to include(@medium3)

    end

    # binding.pry
  end
end
