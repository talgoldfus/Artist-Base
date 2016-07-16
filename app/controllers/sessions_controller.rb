class SessionsController < ApplicationController

  def new
  end

  def create
    if params[:artist]
      @user = Artist.find_by(username: params[:artist][:username])
    elsif params[:fan]
      @user = Fan.find_by(username: params[:fan][:username])
    end
    if @user
      validate_password(@user)
    else
      invalid_username(@user)
    end
  end

  def validate_password(user)
    if user.authenticate(params[:password])
      login(user)
      redirect_to user
    else
      flash[:message] = "Please Enter the Correct Password"
      redirect_to '/login'
    end
  end

  def invalid_username(user)
    if user.nil?
      flash[:message] = "Please enter a valid username"
      redirect_to '/login'
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end
