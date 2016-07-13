class CartsController < ApplicationController
  before_action :login_required

  def show
    @cart= Fan.find(session[:fan_id]).cart
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



end
