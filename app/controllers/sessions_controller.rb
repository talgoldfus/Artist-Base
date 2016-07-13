class SessionsController < ApplicationController

  def new
    # byebug
  end

  def create
    # byebug
    if params[:artist]
      @user = Artist.find_by(username: params[:artist][:username])
    elsif params[:fan]
      @user = Fan.find_by(username: params[:fan][:username])
    end
    if @user.authenticate(params[:password])
      login(@user)
      redirect_to @user
    else
      flash.now[:message] = "Please Enter the Correct Password"
      render 'new'
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end
