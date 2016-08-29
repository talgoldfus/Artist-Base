class ArtistsController < ApplicationController
  before_action :login_required, only: :edit

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.create(artist_params)
    if @artist.id
      session[:artist_id] = @artist.id
      redirect_to @artist
    else
      flash.now[:message]="#{@artist.errors.full_messages.first}"
      render 'new'
    end
  end

  def index
    if params[:search]
      @artists = Artist.search(params[:search]).order("created_at DESC")
    elsif params[:genre_name]
      @artists = artists_media.where("genre = '#{params[:genre_name]}'").uniq
    else
      @artists = Artist.all.order('created_at DESC')
    end
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
    def artists_media
      Artist.all.joins(:media)
    end

    def artist_params
      params.require(:artist).permit(:name, :artist_type, :abstract, :bio, :username, :password, :password_confirmation, :img_link, :city, :state)
    end
end
