class FansController < ApplicationController
  before_action :login_required, only: :edit

  def new
    @fan = Fan.new
  end

  def create

    @fan = Fan.create(fan_params)
    @fan.cart= Cart.create()
    @fan.save
    if @fan.id
      login(@fan)
      redirect_to fan_path(@fan)
    else
      flash.now[:message]="#{@fan.errors.full_messages.first}"
      render 'new'
    end
  end

  def show
    @fan = Fan.find(params[:id])
  end

  def edit
    @fan = Fan.find(params[:id])

  end

  def update
   @fan = Fan.find(params[:id])
   @fan.update(fan_params)
   redirect_to fan_path(@fan)
  end

  def destroy
    sessions[:fan_id] = nil
  end

  private

    def fan_params
      params.require(:fan).permit(:name, :bio, :username, :password, :password_confirmation, :img_link, :city, :state)
    end

end
