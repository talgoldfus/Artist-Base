class CartsController < ApplicationController
  before_action :login_required

  def show
    @cart= Cart.find(current_fan.cart.id)
    redirect_to root_path if params[:id].to_i != @cart.id

  end

  def edit
    @cart= Fan.find(session[:fan_id]).cart
  end

  def update
    @cart= Fan.find(session[:fan_id]).cart
    @cart.media.destroy(cart_params[:media].reject(&:empty?).map{|i| Medium.find(i)})
    redirect_to cart_path(@cart)
  end

  def add_item
    @cart= current_fan.cart
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

  private

  def cart_params
    
    params.require(:cart).permit(media:[])
  end

end
