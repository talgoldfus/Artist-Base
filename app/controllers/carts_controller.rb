class CartsController < ApplicationController
  before_action :login_required

  def show
    @cart= Fan.find(session[:fan_id].to_i).cart
  end

  def edit
    @cart= Fan.find(session[:fan_id]).cart
  end

  def update
    @cart= Fan.find(session[:fan_id]).cart
    @cart.update(cart_params)
  end


  def cart_params
    byebug
    params.require(:cart).permit()
  end

  def add_item
    @cart= Fan.find(session[:fan_id]).cart
    if params[:commit]=="Add collection to favorites"
      item= ImageCollection.find(params[:collection_id])
      item.media.each do |m|
        Item.find_or_create_by(cart_id: @cart.id, medium_id: m.id)
      end
       flash[:message] = "Added collection to favorites"
       redirect_to image_collection_path(item)
    elsif params[:commit]=="Add medium to favorites"
      item= Medium.find(params[:medium_id])
      Item.find_or_create_by(cart_id: @cart.id, medium_id: item.id)
      flash[:message] = "Added medium to favorites"
      redirect_to medium_path(item)
    end
    
  end
end
