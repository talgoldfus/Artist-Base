class ArtistFansController < ApplicationController
  def create
    @artist = Artist.find(artist_params[:artist_id])
    unless current_fan.artists.include?(@artist)
      ArtistFan.create(fan_id: current_fan.id, artist_id: @artist.id)
    end
    flash[:notice] = "You're now of fan of #{@artist.name}"
    redirect_to "/artists/#{@artist.id}"
  end


  private
    def artist_params
      params.permit(:artist_id)
    end
end
