class ArtistsController < ApplicationController
  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.create(artist_params)
    # sessions[:artist_id] = @artist.id
    # redirect_to '/'
    redirect_to @artist
  end

  def index
    @artists = Artist.all
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def update
    @artist = Artist.find(params[:id])
    @artist.update(artist_params)
    redirect_to artist_path(@artist)
  end

  def destroy
    sessions[:artist_id] = nil
  end



  private
    def artist_params
      params.require(:artist).permit(:name, :artist_type, :abstract, :bio)
    end
end
