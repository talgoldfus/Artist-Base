class MediaController < ApplicationController

  def new
    @medium = Medium.new
  end

  def create
    @medium = Medium.create(medium_params)
    redirect_to media_path(@medium)
  end

  def show
    @medium = Medium.find(params[:id])
  end

  def edit
    @medium = Medium.find(params[:id])
  end

  def update
    @medium = Medium.find(params[:id])
    @medium.update(update_params)
  end

  def index
    if params[:search]
      @media = Medium.search(params[:search]).order("created_at DESC")
    elsif params[:genre_name]
      @media = Medium.all.where("genre = '#{params[:genre_name]}'")
    else
      @media=Medium.all.order('created_at DESC')
    end
  end


private
    def update_params
      {name: params[:medium][:name], genre: params[:medium][:genre], price: params[:medium][:price], quantity: [:medium][:quantity]}
    end

  def medium_params
    params.require(:medium).permit(:name,
    :genre,
    :price,
    :quantity,
    :search,
    :img_link,
    img_link)
end

end
