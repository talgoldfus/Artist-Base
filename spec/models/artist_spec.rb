require 'rails_helper'

#associations
#validations
RSpec.describe Artist, type: :model do

  describe '#artist' do
    # setup
    let(:artist) { FactoryGirl.create :artist }
    it 'has a name and type' do
      # trigger of the method
      expect(artist.name).to eq('Leonardo Devenci')
      expect(artist.artist_type).to eq('painter')
      expect(artist.abstract).to eq('I am who i am')
      expect(artist.bio).to eq("Some italian dude painting my life away")
                  # expectation
    end
  end
  # TEARDOWN - deletes the data, in between tests

  describe 'associations' do
    let(:artist) { FactoryGirl.create :artist }
    it 'has a name' do
      expect(Artist.first.name).to eq(artist.name)
    end
  end


end
