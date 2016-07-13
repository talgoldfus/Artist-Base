class MediaController < ApplicationController

  def new
    @medium = Medium.new
  end

  def create
    @medium = Medium.create(medium_params)
    byebug
    redirect_to media_path(@medium)
    #can change the redirect to go to the artist page?
  end

  def show
    @medium = Medium.find(params[:id])
    byebug
  end

  def edit
    @medium = Medium.find(params[:id])
  end

  def update
    @medium = Medium.find(params[:id])
    @medium.update(name: params[:medium][:name], genre: params[:medium][:genre], price: params[:medium][:price], quantity: [:medium][:quantity])
  end

private

def medium_params
  params.require(:medium).permit(:name, :genre, :price, :quantity)
end

end
