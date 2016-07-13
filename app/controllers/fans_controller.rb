class FansController < ApplicationController
  before_action :login_required, only: :edit

  def new
    @fan = Fan.new
  end

  def create
    @fan = Fan.create(fan_params)
    @fan.update(cart_id: Cart.create.id)
    redirect_to fan_path(@fan)
  end

  def show
    @fan = Fan.find(params[:id])
  end

  def edit
    @fan = Fan.find(params[:id])

  end

  def update
   @fan = Fan.find(params[:id])
   @fan.update(name: params[:fan][:name], bio: params[:fan][:bio])
   redirect_to fan_path(@fan)
  end


private

def fan_params
  params.require(:fan).permit(:name, :bio, :username, :password, :password_confirmation)
end

end
