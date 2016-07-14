class MediaController < ApplicationController

  def new
    @medium = Medium.new
  end

  def create
    @medium = Medium.create(medium_params)
    redirect_to media_path(@medium)
    #can change the redirect to go to the artist page?
  end

  def show
    @medium = Medium.find(params[:id])
  end

  def edit
    @medium = Medium.find(params[:id])
  end

  def update
    @medium = Medium.find(params[:id])
    @medium.update(name: params[:medium][:name], genre: params[:medium][:genre], price: params[:medium][:price], quantity: [:medium][:quantity])
  end

  def index
    if params[:genre_name]
      @media = Medium.all.where("genre = '#{params[:genre_name]}'").group('image_collection_id')
    else
      @media=Medium.all
    end
  end


private

def medium_params
  params.require(:medium).permit(:name, :genre, :price, :quantity, :img_link)
end

end
