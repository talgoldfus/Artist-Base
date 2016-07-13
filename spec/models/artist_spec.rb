require 'rails_helper'

#associations
#validations
RSpec.describe Artist, type: :model do

  describe '#artist' do 
    # setup
    let(:artist) { Artist.create(name: 'Avi', abstract: 'Best band in the world!', bio: 'Better than the Beatles', artist_type: 'Guitar player') }
    it 'has a name and type' do 
      # trigger of the method
      expect(artist.name).to eq('Avi')
      expect(artist.artist_type).to eq('Guitar player')
      expect(artist.abstract).to eq('Best band in the world!')
      expect(artist.bio).to eq('Better than the Beatles')
                  # expectation
    end
  end
  # TEARDOWN - deletes the data, in between tests

end