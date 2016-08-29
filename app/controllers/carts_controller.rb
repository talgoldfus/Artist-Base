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
    @cart.media.destroy(cart_media.map{ |i| Medium.find(i) })
    redirect_to cart_path(@cart)
  end

  def add_item
    @cart= Fan.find(session[:fan_id]).cart
    if params[:commit]=="Add collection to favorites"
      process_collection(@cart)
    elsif params[:commit]=="Add medium to favorites"
      process_medium(@cart)
    end
  end

  private

    def cart_media
      cart_params[:media].reject(&:empty?)
    end

    def process_collection(cart)
      collection = add_collection(cart)
      flash[:message] = "Added collection to favorites"
      redirect_to image_collection_path(collection)
    end

    def process_medium(cart)
      medium = add_medium(cart)
      flash[:message] = "Added medium to favorites"
      redirect_to medium_path(medium)
    end

    def add_collection(cart)
      collection = ImageCollection.find(params[:collection_id])
      collection.media.each do |m|
        Item.find_or_create_by(cart_id: cart.id, medium_id: m.id)
      end
      collection
    end

    def add_medium(cart)
      medium = Medium.find(params[:medium_id])
      Item.find_or_create_by(cart_id: cart.id, medium_id: medium.id)
      medium
    end

    def cart_params
      params.require(:cart).permit(media:[])
    end

end
