class ArtistFansController < ApplicationController
  def create
    @artist = Artist.find(artist_params[:artist_id])
    create_connection(@artist)
    flash[:notice] = "You're now of fan of #{@artist.name}!"
    redirect_to "/artists/#{@artist.id}"
  end


  private
    def create_connection(artist)
      unless current_fan.artists.include?(artist)
        ArtistFan.create(fan_id: current_fan.id, artist_id: artist.id)
      end
    end

    def artist_params
      params.permit(:artist_id)
    end
end
