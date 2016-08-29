class FansController < ApplicationController
  before_action :login_required, only: :edit

  def new
    @fan = Fan.new
  end

  def create
    @fan = Fan.create(fan_params)
    create_fan_cart(@fan)
    login_or_show_error(@fan)
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
    def login_or_show_error(fan)
      if fan.id
        handle_post_creation(fan)
      else
        handle_creation_error(fan)
      end
    end

    def handle_post_creation(fan)
      login(fan)
      redirect_to fan_path(fan)
    end

    def handle_creation_error(fan)
      flash.now[:message]="#{fan.errors.full_messages.first}"
      render 'new'
    end

    def create_fan_cart(fan)
      fan.cart= Cart.create()
      fan.save
    end

    def fan_params
      params.require(:fan).permit(:name, :bio, :username, :password, :password_confirmation, :img_link, :city, :state)
    end
end
